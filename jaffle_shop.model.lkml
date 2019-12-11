connection: "bigquery"

include: "views/*.view.lkml"

explore: fct_orders {
  label: "Orders"

  join: dim_customers {
    relationship: many_to_one
    sql_on: ${fct_orders.customer_id} = ${dim_customers.customer_id} ;;
  }
}
