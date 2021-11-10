 view: acxiom_update {
   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT a.*,
       b.postcode_area
FROM ((SELECT ilu_ikey,
       ilu_akey,
       ilu_outputtitle,
       ilu_first,
       ilu_sname,
       ae_address_line_1,
       ae_address_line_2,
       ae_address_line_3,
       ae_address_line_4,
       ae_address_line_5,
       ae_town_name,
       ae_county_name,
       ae_post_code_name,
       ilu_marryd3,
       ilu_hhstage2,
       ilu_hhkids,
       ilu_hhkid0004,
       ilu_hhlenres,
       ilu_hhdatehomebuilt,
       ilu_ownrnt,
       ilu_hhpropertytype,
       pc_populationdensity,
       ilu_hhsize,
       ilu_hhcomposition,
       ilu_occy3,
       ilu_hhsocioecon,
       ilu_hhearners,
       ilu_hhunemployed,
       ilu_hhafflu,
       ilu_rowhol,
       ilu_ftravel,
       mod_hhccardpay,
       mod_hhccardbalance,
       ilu_numcreditcards,
       ilu_persloan,
       ilu_hhinvestrank,
       ilu_hhinsurerank,
       ilu_savingsplan,
       ilu_privmedic,
       ilu_funeral,
       ilu_mobilecontract,
       ilu_internetaccess,
       ils_personicx_ind,
       ilu_hhindulgerank,
       qas_return_code,
       qas_key,
       load_dttm,
              '0' AS new
       FROM acxiom)
       UNION ALL
       (SELECT ilu_complianceid AS ilu_ikey,
       uprn AS ilu_akey,
       ilu_outputtitle,
       ilu_first,
       ilu_sname,
       ae_address_line_1,
       ae_address_line_2,
       ae_address_line_3,
       ae_address_line_4,
       ae_address_line_5,
       ae_town_name,
       ae_county_name,
       ae_post_code_name,
       ilu_marryd3,
       ilu_hhstage2,
       ilu_hhkids,
       ilu_hhkid0004,
       ilu_hhlenres,
       ilu_hhdatehomebuilt,
       ilu_ownrnt,
       ilu_hhpropertytype,
       pc_populationdensity,
       ilu_hhsize,
       ilu_hhcomposition,
       ilu_occy3,
       ilu_hhsocioecon,
       ilu_hhearners,
       ilu_hhunemployed,
       ilu_hhafflu,
       ilu_rowhol,
       ilu_ftravel,
       mod_hhccardpay,
       mod_hhccardbalance,
       ilu_numcreditcards,
       ilu_persloan,
       ilu_hhinvestrank,
       ilu_hhinsurerank,
       ilu_savingsplan,
       ilu_privmedic,
       ilu_funeral,
       ilu_mobilecontract,
       ilu_internetaccess,
       ils_personicx_ind,
       ilu_hhindulgerank,
       qas_return_code,
       qas_key,
       load_dttm,
              '1' AS new
       FROM acxiom_new
        )) a
  LEFT JOIN postcode_geography b ON REPLACE (a.ae_post_code_name,' ','') = b.postcode
       ;;
   }

  dimension: postcode_area {
    type: string
    map_layer_name: uk_postcode_areas
    sql: ${TABLE}.postcode_area ;;
  }

   dimension: ae_county_name {
     type: string
     sql: ${TABLE}.ae_county_name ;;
   }

  dimension: ilu_marryd3 {
    type: number
    sql: ${TABLE}.ilu_marryd3 ;;
  }

  dimension: ilu_hhkid0004 {
    type: number
    sql: ${TABLE}.ilu_hhkid0004 ;;
  }

  dimension: ilu_hhlenres {
    type: number
    sql: ${TABLE}.ilu_hhlenres ;;
  }

  dimension: ilu_hhdatehomebuilt {
    type: number
    sql: ${TABLE}.ilu_hhdatehomebuilt ;;
  }

  dimension: ilu_occy3 {
    type: string
    sql: ${TABLE}.ilu_occy3 ;;
  }

  dimension: ilu_hhearners {
    type: number
    sql: ${TABLE}.ilu_hhearners ;;
  }

  dimension: ilu_hhstage2 {
    type: number
    sql: ${TABLE}.ilu_hhstage2 ;;
  }

  dimension: ilu_hhkids {
    type: number
    sql: ${TABLE}.ilu_hhkids ;;
  }

  dimension: ilu_ownrnt {
    type: number
    sql: ${TABLE}.ilu_ownrnt ;;
  }

  dimension: ilu_hhpropertytype {
    type: number
    sql: ${TABLE}.ilu_hhpropertytype ;;
  }

  dimension: pc_populationdensity {
    type: number
    sql: ${TABLE}.pc_populationdensity ;;
  }

  dimension: ilu_hhsize {
    type: number
    sql: ${TABLE}.ilu_hhsize ;;
  }

  dimension: ilu_hhcomposition {
    type: string
    sql: ${TABLE}.ilu_hhcomposition ;;
  }

  dimension: ilu_hhsocioecon {
    type: number
    sql: ${TABLE}.ilu_hhsocioecon ;;
  }

  dimension: ilu_hhunemployed {
    type: number
    sql: ${TABLE}.ilu_hhunemployed ;;
  }

  dimension: ilu_hhafflu {
    type: number
    sql: ${TABLE}.ilu_hhafflu ;;
  }

  dimension: ilu_rowhol {
    type: number
    sql: ${TABLE}.ilu_rowhol ;;
  }

  dimension: ilu_ftravel {
    type: number
    sql: ${TABLE}.ilu_ftravel ;;
  }

  dimension: mod_hhccardpay {
    type: number
    sql: ${TABLE}.mod_hhccardpay ;;
  }

  dimension: mod_hhccardbalance {
    type: number
    sql: ${TABLE}.mod_hhccardbalance ;;
  }

  dimension: ilu_numcreditcards {
    type: number
    sql: ${TABLE}.ilu_numcreditcards ;;
  }

  dimension: ilu_persloan {
    type: number
    sql: ${TABLE}.ilu_persloan ;;
  }

  dimension: ilu_hhinvestrank {
    type: number
    sql: ${TABLE}.ilu_hhinvestrank ;;
  }

  dimension: ilu_hhinsurerank {
    type: number
    sql: ${TABLE}.ilu_hhinsurerank ;;
  }

  dimension: ilu_savingsplan {
    type: number
    sql: ${TABLE}.ilu_savingsplan ;;
  }

  dimension: ilu_privmedic {
    type: number
    sql: ${TABLE}.ilu_privmedic ;;
  }

  dimension: ilu_funeral {
    type: number
    sql: ${TABLE}.ilu_funeral ;;
  }

  dimension: ilu_mobilecontract {
    type: number
    sql: ${TABLE}.ilu_mobilecontract ;;
  }

  dimension: ilu_internetaccess {
    type: number
    sql: ${TABLE}.ilu_internetaccess ;;
  }

  dimension: ils_personicx_ind {
    type: string
    sql: ${TABLE}.ils_personicx_ind ;;
  }

  dimension: ilu_hhindulgerank {
    type: number
    sql: ${TABLE}.ilu_hhindulgerank ;;
  }

  dimension: new {
    type: string
    sql: case when ${TABLE}.new = 1 then 'New' else 'Current' end ;;
  }

  measure: amount_new {
    type:  number
    sql: 1.0*SUM(CASE WHEN ${TABLE}.new = 1 THEN 1 ELSE 0 END)/ 35265510
 ;;
  }

  measure: count_new {
    type:  number
    sql: 1.0*SUM(CASE WHEN ${TABLE}.new = 1 THEN 1 ELSE 0 END)
      ;;
  }

  measure: amount_old {
    type:  number
    sql: 1.0*SUM(CASE WHEN ${TABLE}.new = 1 THEN 0 ELSE 1 END)/ 86658413
 ;;
  }

  measure: count_old {
    type:  number
    sql: 1.0*SUM(CASE WHEN ${TABLE}.new = 1 THEN 0 ELSE 1 END)
      ;;
     }

  measure:  number_of_records {
    type: number
    sql: count(*) ;;

  }
}
