view: derived_table_test {
  filter: templated_filter_test {
  }

  derived_table: {
    sql: SELECT brand as brand
    category as category
    FROM demo_db.products
    WHERE category = (SELECT category
                        FROM demo_db.products
                        WHERE {% condition templated_filter_test %} category {% endcondition %} ;;
  }

  }
