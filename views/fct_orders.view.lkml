view: fct_orders {
  sql_table_name: analytics.fct_orders ;;

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bank_transfer_amount {
    type: number
    sql: ${TABLE}.bank_transfer_amount ;;
  }

  dimension: coupon_amount {
    type: number
    sql: ${TABLE}.coupon_amount ;;
  }

  dimension: credit_card_amount {
    type: number
    sql: ${TABLE}.credit_card_amount ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: gift_card_amount {
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

  measure: count {
    type: count
    drill_fields: []
  }
}
