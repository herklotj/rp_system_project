view: iitables {
  derived_table: {
    sql: select
        table_name,
        table_owner,
        CAST(replace(replace(create_date,'_','-'),'GMT','') AS TIMESTAMP) AS create_date,
        CAST(replace(replace(alter_date,'_','-'),'GMT','') AS TIMESTAMP) AS alter_date,
        table_type,
        CAST(replace(replace(modify_date,'_','-'),'GMT','') AS TIMESTAMP) AS modify_date
from iitables ;;}

  dimension: table_name{
    type: string
    sql: ${TABLE}.table_name ;;
  }
  dimension: table_owner {
    type: string
    sql: ${TABLE}.table_owner ;;
  }
  dimension_group: create_date  {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.create_date ;;
  }
  dimension_group: alter_date  {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.alter_date ;;
  }
  dimension: table_type {
    type: string
    sql: ${TABLE}.table_type ;;
  }
  dimension_group: modify_date  {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.modify_date ;;
  }
  }
