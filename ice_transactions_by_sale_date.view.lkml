view: ice_transactions_by_sale_date {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: select
date_trunc('DAY',sale_timestamp) as sold_date,
sum(case when scheme = '102' and policy_transaction_type = 'NEW_BUSINESS' then 1 else 0 end) as AAG_NEW_BUSINESS,
sum(case when scheme = '103' and policy_transaction_type = 'NEW_BUSINESS' then 1 else 0 end) as ANM_NEW_BUSINESS,
sum(case when scheme = '173' and policy_transaction_type = 'NEW_BUSINESS' then 1 else 0 end) as ACG_NEW_BUSINESS,
sum(case when policy_transaction_type = 'NEW_BUSINESS' then 1 else 0 end) as NEW_BUSINESS
from ice_aa_policy_summary a left join
hourly_sales b
on upper(a.insurerquoteref) = upper(b.insurer_quote_ref)
group by date_trunc('DAY',sale_timestamp)

       ;;
   }

  dimension_group: sold_date {
    type: time
    timeframes: [date, time, week, month, year]
    sql: ${TABLE}.sold_date ;;
  }

   # Define your dimensions and measures here, like this:
  measure: aag_new_business {
    description: "102 New Business Transactions"
    type: sum
    sql: ${TABLE}.aag_new_business ;;
  }

  measure: anm_new_business {
    description: "103 New Business Transactions"
    type: sum
    sql: ${TABLE}.anm_new_business ;;
  }

  measure: acg_new_business {
    description: "173 New Business Transactions"
    type: sum
    sql: ${TABLE}.acg_new_business ;;
  }


}
