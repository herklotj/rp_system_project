connection: "echo_actian"

# include all the views
include: "*.view"

datagroup: system_project_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: system_project_default_datagroup

explore:  iitables {}

explore:  load_times {}