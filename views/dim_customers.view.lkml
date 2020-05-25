view: dim_customers {
  sql_table_name: analytics.dim_customers ;;
  label: "Customers"

  dimension: customer_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: customer_lifetime_value {
    type: number
    sql: ${TABLE}.customer_lifetime_value ;;
  }

  dimension: customer_lifetime_value_x_1k {
    type: number
    sql: ${customer_lifetime_value} * 100 ;;
  }

  dimension_group: first_order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.first_order ;;
  }

  dimension_group: most_recent_order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.most_recent_order ;;
  }

  dimension: number_of_orders {
    type: number
    sql: ${TABLE}.numbers_of_orders ;;
  }

  measure: count_customers {
    label: "Number of Customers"
    type: count
    drill_fields: []
  }
}
