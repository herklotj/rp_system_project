view: aap_v_ice {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT ice.uwyr,
       ice.scheme_number,
      ice.polnum,
       ice.exposure AS ice_exposure,
       aap.exposure AS aap_exposure,
       ice.eprem AS ice_eprem,
       aap.eprem AS aap_eprem,
       100*ice.total_incurred_cap_25k / ice.eprem AS ice_lr_cap_25k,
       100*aap.total_incurred_cap_25k / aap.eprem AS aap_lr_cap_25k,
       100*ice.total_incurred_cap_50k / ice.eprem AS ice_lr_cap_50k,
       100*aap.total_incurred_cap_50k / aap.eprem AS aap_lr_cap_50k,
       100*ice.total_incurred_cap_1m / ice.eprem AS ice_lr_cap_1m,
       100*aap.total_incurred_cap_1m / aap.eprem AS aap_lr_cap_1m,
       100*ice.total_incurred / ice.eprem AS ice_lr_uncapped,
       100*aap.total_incurred / aap.eprem AS aap_lr_uncapped,
       100*ice.total_fault / ice.exposure AS fault_freq_ice,
       100*aap.total_fault / aap.exposure AS fault_freq_aap
FROM (SELECT uwyr,
             scheme_number,
            polnum,
             SUM(eprem) AS eprem,
             SUM(CASE WHEN total_incurred > 1000000 THEN 1000000 ELSE total_incurred END) AS total_incurred_cap_1m,
             SUM(total_incurred_cap_50k) AS total_incurred_cap_50k,
             SUM(total_incurred_cap_25k) AS total_incurred_cap_25k,
             SUM(total_incurred) AS total_incurred,
             SUM(total_count_exc_ws) AS total_fault,
             SUM(evy) AS exposure
      FROM icepoclm
      GROUP BY uwyr,
               scheme_number,
              polnum) ice
  LEFT JOIN (SELECT uwyr,
                    scheme_number,
                    polnum,
                    SUM(eprem) AS eprem,
                    SUM(CASE WHEN total_incurred > 1000000 THEN 1000000 ELSE total_incurred END) AS total_incurred_cap_1m,
                    SUM(total_incurred_cap_50k) AS total_incurred_cap_50k,
                    SUM(total_incurred_cap_25k) AS total_incurred_cap_25k,
                    SUM(total_incurred) AS total_incurred,
                    SUM(total_count_exc_ws) AS total_fault,
                    SUM(evy) AS exposure
             FROM expoclm
             GROUP BY uwyr,
                      scheme_number,
                      polnum) aap ON ice.uwyr = aap.uwyr AND ice.scheme_number = aap.scheme_number AND ice.polnum = aap.polnum


       ;;
   }

   # Define your dimensions and measures here, like this:
   dimension: uwyr {
     type: string
     sql: ${TABLE}.uwyr ;;
   }

  dimension: scheme {
    type: string
    sql: ${TABLE}.scheme_number ;;
  }

  dimension: polnum {
    type: string
    sql: ${TABLE}.polnum ;;
  }

   measure: ice_exposure {
     type: sum
     sql: ${TABLE}.ice_exposure ;;
    value_format: "0.##"
   }

  measure: aap_exposure {
    type: sum
    sql: ${TABLE}.aap_exposure ;;
    value_format: "0.##"
  }

  measure: ice_eprem {
    type: sum
    sql: ${TABLE}.ice_eprem ;;
    value_format: "0.##"
  }

  measure: aap_eprem {
    type: sum
    sql: ${TABLE}.aap_eprem ;;
    value_format: "0.##"
  }

  measure: ice_lr_25k {
    type: sum
    sql: ${TABLE}.ice_lr_cap_25k ;;
    value_format: "0.##"
  }

  measure: aap_lr_25k {
    type: sum
    sql: ${TABLE}.aap_lr_cap_25k ;;
    value_format: "0.##"
  }

  measure: ice_lr_50k {
    type: sum
    sql: ${TABLE}.ice_lr_cap_50k ;;
    value_format: "0.##"
  }

  measure: aap_lr_50k {
    type: sum
    sql: ${TABLE}.aap_lr_cap_50k ;;
    value_format: "0.##"
  }

  measure: ice_lr_1m {
    type: sum
    sql: ${TABLE}.ice_lr_cap_1m ;;
    value_format: "0.##"
  }

  measure: aap_lr_1m {
    type: sum
    sql: ${TABLE}.aap_lr_cap_1m ;;
    value_format: "0.##"
  }

  measure: ice_lr {
    type: sum
    sql: ${TABLE}.ice_lr_uncapped ;;
    value_format: "0.##"
  }

  measure: aap_lr {
    type: sum
    sql: ${TABLE}.aap_lr_uncapped ;;
    value_format: "0.##"
  }

  measure: fault_freq_ice {
    type: sum
    sql: ${TABLE}.fault_freq_ice ;;
    value_format: "0.##"
  }

  measure: fault_freq_aap {
    type: sum
    sql: ${TABLE}.fault_freq_aap ;;
    value_format: "0.##"
  }

  measure: eprem_diff {
    type: sum
    sql:  ${TABLE}.ice_eprem - ${TABLE}.aap_eprem ;;
  }
}
