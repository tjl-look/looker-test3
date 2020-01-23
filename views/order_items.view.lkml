view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  parameter: date_test {
    type: date
  }
  parameter: test_id {
    type: number
    suggest_dimension: id
    hidden: yes
    allowed_value: {
      label: "yes"
      value: "yes"
    }
    default_value: "yes"
  }


  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    label: " "
    sql: ${TABLE}.sale_price ;;
    #html: <a href = "https://open.spotify.com/track/3cMBzDRp3OkdhFYPqmxyUc?si=4fF4mhSTQNmChU50YHpMBg" target="_blank"> <button> Click Me </button></a>;;
    html: <audio src = "https://p.scdn.co/mp3-preview/3d59b98d2f384dd78c8a3de9e77ac626c2d517f5?cid=fe13319eff4b4db48fc03384d9a5cd0a" controls height = "50" width = "100" </audio> ;;
  }


  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
    html: <a href = "">{{ value }}</a>;;
  }
  measure: unique_order_items {
    type: count_distinct
    sql: ${id} ;;
  }

  dimension: woohoo {
    type: string
    sql: "John's" ;;
  }
  measure: test_date {
    type: yesno
    sql: ${returned_time} >= CURRENT_TIMESTAMP() ;;
  }

  measure: sum_test {
    type: sum
    sql: (${TABLE}.sale_price) / 12 ;;
  }
  measure: sum_blank {
    type: sum
    sql: ${TABLE}.sale_price ;;
  }


}
