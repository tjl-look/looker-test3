view: products {
  sql_table_name: demo_db.products ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    html: <span title="{{ category._rendered_value }}">{{ rendered_value }}</span>;;
  }

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: retail_price {
    type: number
    sql: ${TABLE}.retail_price ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }
  dimension: test {
    type: string
    sql: CASE WHEN ${department} = "male" THEN "x"
    WHEN ${department} = "female" THEN "y"
    END;;
  }
  measure: test_count {
    type: count_distinct
    sql: CONCAT(${category},${department});;
  }

  measure: avg_measure {
    type: average
    sql: ${retail_price} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, item_name, inventory_items.count]
  }
}
