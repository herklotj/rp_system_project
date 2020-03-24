view: iipermits {
  derived_table: {sql:
    SELECT
       object_name,
       object_owner,
       permit_grantor,
       object_type,
       create_date,
       permit_user,
       permit_depth,
       permit_number,
       text_sequence,
       text_segment
FROM iipermits ;;}

dimension: object_name {
  type:  string
  sql: ${TABLE}.object_name ;;
}
dimension: object_owner {
  type:  string
}
}
