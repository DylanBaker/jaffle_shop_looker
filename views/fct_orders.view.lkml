view: fct_orders {
  sql_table_name: analytics.fct_orders ;;
  label: "Orders"

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bank_transfer_amount {
    group_label: "Payment Type Amounts"
    type: number
    sql: ${TABLE}.bank_transfer_amount ;;
  }

  dimension: coupon_amount {
    group_label: "Payment Type Amounts"
    type: number
    sql: ${TABLE}.coupon_amount ;;
  }

  dimension: credit_card_amount {
    group_label: "Payment Type Amounts"
    type: number
    sql: ${TABLE}.credit_card_amount ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: gift_card_amount {
    group_label: "Payment Type Amounts"
    type: number
    sql: ${TABLE}.gift_card_amount ;;
  }

  dimension_group: order {
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
    sql: ${TABLE}.order_date ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  measure: count_orders {
    label: "Number of Orders"
    type: count
    drill_fields: []
  }

  measure: average_order_value {
    type: average
    sql: ${amount} ;;
  }
}
