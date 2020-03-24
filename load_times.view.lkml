 view: load_times {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT *
FROM (SELECT MAX(loaddttm) AS ice_batch_last_loaded
      FROM ice_dim_question_answer) batch
  CROSS JOIN (SELECT MAX(loaddttm) AS ice_composite_last_loaded
              FROM ice_aa_claim_financials) comp
  CROSS JOIN (SELECT MAX(exposure_asat) AS exp_last_loaded FROM expoclm) EXP
  CROSS JOIN (SELECT MAX(load_dttm) AS aap_start_loading FROM aap_addrref) aap_start
  CROSS JOIN (SELECT MAX(load_dttm) AS aap_end_loading
              FROM aap_businesstransaction) aap_end
  CROSS JOIN (SELECT MAX(loaddttm) AS counter_fraud_last_loaded
              FROM cf_cue_discrepencies) cf
  CROSS JOIN (SELECT MAX(load_dttm) AS lk_last_loaded
              FROM lk_m_policy_history) lk ;;}

   dimension_group: ice_batch_last_loaded {
     type: time
     timeframes: [date, week, month, year]
     sql: ${TABLE}.ice_batch_last_loaded ;;
   }

    dimension_group: ice_composite_last_loaded {
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.ice_composite_last_loaded ;;
    }

    dimension_group: exp_last_loaded {
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.exp_last_loaded ;;
    }

    dimension_group: aap_start_loading {
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.aap_start_loading ;;
    }

    dimension_group: aap_end_loading {
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.aap_end_loading ;;
    }

    dimension_group: counter_fraud_last_loaded {
      type: time
      timeframes: [date, week, month, year]
      sql: ${TABLE}.counter_fraud_last_loaded ;;
    }

  dimension_group: lk_last_loaded {
    type: time
    timeframes: [date, week, month, year]
    sql: ${TABLE}.lk_last_loaded ;;
  }
 }
