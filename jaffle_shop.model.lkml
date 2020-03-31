connection: "bigquery"

include: "views/*.view.lkml"

explore: fct_orders {
  label: "Orders"

  join: dim_customers {
    relationship: many_to_one
    sql_on: ${fct_orders.customer_id} = ${dim_customers.customer_id} ;;
  }
}

test: historic_revenue_is_accurate {
  explore_source: fct_orders {
    column: number_of_orders {
      field: fct_orders.count_orders
    }
    filters: {
      field: fct_orders.order_year
      value: "2018"
    }
  }
  assert: revenue_is_expected_value {
    expression: ${fct_orders.count_orders} = 99 ;;
  }
}
