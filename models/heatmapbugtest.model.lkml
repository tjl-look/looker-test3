connection: "thelook"
#look at this change tim
# include all the views
include: "/views/**/*.view"

datagroup: datagroup {
   sql_trigger: SELECT CURDATE() ;;
  max_cache_age: "1 hour"
}




explore: connection_reg_r3 {}

explore: epoch_test {}

explore: events {
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: ints {}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
  access_filter: {
    field: products.brand
    user_attribute: test_attribute_plz_break
  }
}

explore: order_items {
  view_label: "weeeeeeeeee"
   join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}


explore: products {}

explore: schema_migrations {}

explore: test_img {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: derived_table_test {}

explore: users {}

explore: users_nn {}

explore: dg_test {
  from:  order_items
  join: orders {
    type: left_outer
    sql_on: ${dg_test.order_id} = ${orders.id};;
    relationship: many_to_one
    fields: [orders.created_date, orders.created_raw, orders.created_week,orders.created_month]
  }
}
