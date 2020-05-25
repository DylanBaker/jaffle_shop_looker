connection: "bigquery"

include: "views/*.view.lkml"

explore: fct_orders {
  label: "Orders"

  join: dim_customers {
    relationship: many_to_one
    sql_on: ${fct_orders.customer_id} = ${dim_customers.customer_id} ;;
  }
}

test: fct_orders_test {
  explore_source: fct_orders {
    column: count_orders {
      field: fct_orders.count_orders
    }
  }
  assert: n_orders_equals_val {
    expression: ${fct_orders.count_orders} = 95 ;;
  }
}
