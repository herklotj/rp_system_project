view: ice_transactions_by_audit_key {
 derived_table: {
     sql:SELECT audit_key,
       SUM(CASE WHEN scheme = '102' AND policy_transaction_type = 'NEW_BUSINESS' THEN 1 ELSE 0 END) AS AAG_NEW_BUSINESS,
       SUM(CASE WHEN scheme = '102' AND policy_transaction_type = 'RENEWAL_ACCEPT' THEN 1 ELSE 0 END) AS AAG_RENEWAL_ACCEPT,
       SUM(CASE WHEN scheme = '102' AND policy_transaction_type = 'LAPSE' THEN 1 ELSE 0 END) AS AAG_LAPSE,
       SUM(CASE WHEN scheme = '102' AND policy_transaction_type = 'CANCELLATION' THEN 1 ELSE 0 END) AS AAG_CANCELLATION,
       SUM(CASE WHEN scheme = '102' AND policy_transaction_type = 'MID_TERM_ADJUSTMENT' THEN 1 ELSE 0 END) AS AAG_MID_TERM_ADJUSTMENT,
       SUM(CASE WHEN scheme = '102' AND policy_transaction_type = 'MID_TERM_ADJUSTMENT_TEMPORARY' THEN 1 ELSE 0 END) AS AAG_MID_TERM_ADJUSTMENT_TEMPORARY,
       SUM(CASE WHEN scheme = '102' THEN 1 ELSE 0 END) AS AAG_ALL_TRANSACTIONS,
       SUM(CASE WHEN scheme = '103' AND policy_transaction_type = 'NEW_BUSINESS' THEN 1 ELSE 0 END) AS ANM_NEW_BUSINESS,
       SUM(CASE WHEN scheme = '103' AND policy_transaction_type = 'RENEWAL_ACCEPT' THEN 1 ELSE 0 END) AS ANM_RENEWAL_ACCEPT,
       SUM(CASE WHEN scheme = '103' AND policy_transaction_type = 'LAPSE' THEN 1 ELSE 0 END) AS ANM_LAPSE,
       SUM(CASE WHEN scheme = '103' AND policy_transaction_type = 'CANCELLATION' THEN 1 ELSE 0 END) AS ANM_CANCELLATION,
       SUM(CASE WHEN scheme = '103' AND policy_transaction_type = 'MID_TERM_ADJUSTMENT' THEN 1 ELSE 0 END) AS ANM_MID_TERM_ADJUSTMENT,
       SUM(CASE WHEN scheme = '103' AND policy_transaction_type = 'MID_TERM_ADJUSTMENT_TEMPORARY' THEN 1 ELSE 0 END) AS ANM_MID_TERM_ADJUSTMENT_TEMPORARY,
       SUM(CASE WHEN scheme = '103' THEN 1 ELSE 0 END) AS ANM_ALL_TRANSACTIONS,
       SUM(CASE WHEN scheme = '173' AND policy_transaction_type = 'NEW_BUSINESS' THEN 1 ELSE 0 END) AS ACG_NEW_BUSINESS,
       SUM(CASE WHEN scheme = '173' AND policy_transaction_type = 'RENEWAL_ACCEPT' THEN 1 ELSE 0 END) AS ACG_RENEWAL_ACCEPT,
       SUM(CASE WHEN scheme = '173' AND policy_transaction_type = 'LAPSE' THEN 1 ELSE 0 END) AS ACG_LAPSE,
       SUM(CASE WHEN scheme = '173' AND policy_transaction_type = 'CANCELLATION' THEN 1 ELSE 0 END) AS ACG_CANCELLATION,
       SUM(CASE WHEN scheme = '173' AND policy_transaction_type = 'MID_TERM_ADJUSTMENT' THEN 1 ELSE 0 END) AS ACG_MID_TERM_ADJUSTMENT,
       SUM(CASE WHEN scheme = '173' AND policy_transaction_type = 'MID_TERM_ADJUSTMENT_TEMPORARY' THEN 1 ELSE 0 END) AS ACG_MID_TERM_ADJUSTMENT_TEMPORARY,
       SUM(CASE WHEN scheme = '173' THEN 1 ELSE 0 END) AS ACG_ALL_TRANSACTIONS,
       SUM(CASE WHEN policy_transaction_type = 'NEW_BUSINESS' THEN 1 ELSE 0 END) AS NEW_BUSINESS,
       SUM(CASE WHEN policy_transaction_type = 'RENEWAL_ACCEPT' THEN 1 ELSE 0 END) AS RENEWAL_ACCEPT,
       SUM(CASE WHEN policy_transaction_type = 'LAPSE' THEN 1 ELSE 0 END) AS LAPSE,
       SUM(CASE WHEN policy_transaction_type = 'CANCELLATION' THEN 1 ELSE 0 END) AS CANCELLATION,
       SUM(CASE WHEN policy_transaction_type = 'MID_TERM_ADJUSTMENT' THEN 1 ELSE 0 END) AS MID_TERM_ADJUSTMENT,
       SUM(CASE WHEN policy_transaction_type = 'MID_TERM_ADJUSTMENT_TEMPORARY' THEN 1 ELSE 0 END) AS MID_TERM_ADJUSTMENT_TEMPORARY,
       COUNT(*) AS ALL_TRANSACTIONS
FROM ice_aa_policy_summary
GROUP BY audit_key
;;
}

   dimension: audit_key {
     type: number
     sql: ${TABLE}.audit_key ;;
   }
  measure: aag_new_business {
    description: "102 New Business Transactions"
    type: sum
    sql: ${TABLE}.aag_new_business ;;
  }

  measure: aag_renewal_accept {
    description: "102 Renewal Transactions"
    type: sum
    sql: ${TABLE}.aag_renewal_accept ;;
  }

  measure: aag_lapse {
    description: "102 Lapse Transactions"
    type: sum
    sql: ${TABLE}.aag_lapse ;;
  }

  measure: aag_cancellation {
    description: "102 Cancellation Transactions"
    type: sum
    sql: ${TABLE}.aag_cancellation ;;
  }

  measure: aag_mid_term_adjustment {
    description: "102 MTA Transactions"
    type: sum
    sql: ${TABLE}.aag_mid_term_adjustment;;
  }

  measure: aag_mid_term_adjustment_temporary {
    description: "102 Temporary MTA Transactions"
    type: sum
    sql: ${TABLE}.aag_mid_term_adjustment_temporary ;;
  }

  measure: aag_all_transactions {
    description: "102 All Transactions"
    type: sum
    sql: ${TABLE}.aag_all_transactions ;;
  }

  measure: anm_new_business {
    description: "103 New Business Transactions"
    type: sum
    sql: ${TABLE}.aag_new_business ;;
  }

  measure: anm_renewal_accept {
    description: "103 Renewal Transactions"
    type: sum
    sql: ${TABLE}.anm_renewal_accept ;;
  }

  measure: anm_lapse {
    description: "103 Lapse Transactions"
    type: sum
    sql: ${TABLE}.anm_lapse ;;
  }

  measure: anm_cancellation {
    description: "103 Cancellation Transactions"
    type: sum
    sql: ${TABLE}.anm_cancellation ;;
  }

  measure: anm_mid_term_adjustment {
    description: "103 MTA Transactions"
    type: sum
    sql: ${TABLE}.anm_mid_term_adjustment ;;
  }

  measure: anm_mid_term_adjustment_temporary {
    description: "103 Temporary MTA Transactions"
    type: sum
    sql: ${TABLE}.anm_mid_term_adjustment_temporary ;;
  }

  measure: anm_all_transactions {
    description: "103 All Transactions"
    type: sum
    sql: ${TABLE}.anm_all_transactions ;;
  }

  measure: acg_new_business {
    description: "173 New Business Transactions"
    type: sum
    sql: ${TABLE}.acg_new_business ;;
  }

  measure: acg_renewal_accept {
    description: "173 Renewal Transactions"
    type: sum
    sql: ${TABLE}.acg_renewal_accept ;;
  }

  measure: acg_lapse {
    description: "173 Lapse Transactions"
    type: sum
    sql: ${TABLE}.acg_lapse ;;
  }

  measure: acg_cancellation {
    description: "173 Cancellation Transactions"
    type: sum
    sql: ${TABLE}.acg_cancellation ;;
  }

  measure: acg_mid_term_adjustment {
    description: "173 MTA Transactions"
    type: sum
    sql: ${TABLE}.acg_mid_term_adjustment ;;
  }

  measure: acg_mid_term_adjustment_temporary {
    description: "173 Temporary MTA Transactions"
    type: sum
    sql: ${TABLE}.acg_mid_term_adjustment_temporary ;;
  }

  measure: acg_all_transactions {
    description: "173 All Transactions"
    type: sum
    sql: ${TABLE}.acg_all_transactions ;;
  }
}
