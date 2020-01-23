view: sql_runner_query {
  derived_table: {
    sql: select user_id
      from orders
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [user_id]
  }
}
