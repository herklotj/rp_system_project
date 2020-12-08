 view: ra_refresh_motor {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: (SELECT *,
       0 AS new_postcode
FROM rated_areas)
UNION ALL
(SELECT *,
       1 AS new_postcode
FROM new_ra_update_motor)
       ;;
   }

   # Define your dimensions and measures here, like this:
   dimension: ad_rated_area {
     type: number
     sql: ${TABLE}.ad_rated_area ;;
   }

  dimension: tp_rated_area {
    type: number
    sql: ${TABLE}.tp_rated_area ;;
  }

  dimension: pi_rated_area {
    type: number
    sql: ${TABLE}.pi_rated_area ;;
  }

  dimension: ot_rated_area {
    type: number
    sql: ${TABLE}.ot_rated_area ;;}

    dimension: ws_rated_area {
      type: number
      sql: ${TABLE}.ws_rated_area ;;
  }

  dimension: num_active_cmc_pi_5km {
    type: number
    sql: ${TABLE}.num_active_cmc_pi_5km ;;
  }

  dimension: num_active_cmc_pi_10km {
    type: number
    sql: ${TABLE}.num_active_cmc_pi_10km ;;
  }

  dimension: num_active_cmc_any_5km {
    type: number
    sql: ${TABLE}.num_active_cmc_any_5km ;;
  }

  dimension: num_active_cmc_any_10km {
    type: number
    sql: ${TABLE}.num_active_cmc_any_10km ;;
  }

  dimension: num_all_cmc_pi_5km {
    type: number
    sql: ${TABLE}.num_all_cmc_pi_5km ;;
  }

  dimension: num_all_cmc_pi_10km {
    type: number
    sql: ${TABLE}.num_all_cmc_pi_10km ;;
  }

  dimension: num_all_cmc_any_5km {
    type: number
    sql: ${TABLE}.num_all_cmc_any_5km ;;
  }

  dimension: num_pi_500m_band {
    type: number
    sql: ${TABLE}.num_pi_500m_band ;;
  }

  dimension: num_pi_1km_band {
    type: number
    sql: ${TABLE}.num_pi_1km_band ;;
  }

  dimension: num_pi_2km_band {
    type: number
    sql: ${TABLE}.num_pi_2km_band ;;
  }

  dimension: num_pi_5km_band {
    type: number
    sql: ${TABLE}.num_pi_5km_band ;;
  }

  dimension: num_pi_10km_band {
    type: number
    sql: ${TABLE}.num_pi_10km_band ;;
  }

  dimension: new_postcode {
    type: string
    sql: CASE WHEN ${TABLE}.new_postcode = 1 THEN 'New' Else 'Existing' END;;
  }
   measure: count {
     type: count_distinct
     sql: ${TABLE}.postcode ;;
   }
 }
