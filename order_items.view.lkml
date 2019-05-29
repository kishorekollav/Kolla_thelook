view: order_items {
  sql_table_name: PUBLIC.ORDER_ITEMS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."CREATED_AT" ;;
  }

  dimension_group: delivered {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DELIVERED_AT" ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."INVENTORY_ITEM_ID" ;;
  }


  dimension: order_id {
    type: number
    sql: ${TABLE}."ORDER_ID" ;;
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
      year
    ]
    sql: ${TABLE}."RETURNED_AT" ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}."SALE_PRICE" ;;
  }



  dimension: is_luxury {
    type: yesno
    sql: ${sale_price}>60 ;;
  }

  dimension_group: shipped {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."SHIPPED_AT" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."STATUS" ;;
  }

   dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}."USER_ID" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Order_Total{
    type: sum_distinct
    sql_distinct_key: ${order_id} ;;
    sql: ${sale_price} ;;
    }

  measure: min {
    type: min
    sql: ${sale_price} ;;
    }
  measure: Sum {
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
    }
  measure: max {
    type: max
    sql: ${sale_price} ;;
  }
  measure: avg {
    label: "Average"
    description: "Average of sale price"
    type: average
    sql: ${sale_price} ;;
  }

  measure: number_of_orders{
    type: count_distinct
    sql: ${order_id} ;;
  }

  measure: percent_completed_orders {
    type: number
    label: "Completed Orders in Perc"
    description: "Percentage contribution to completed orders"
    sql:(1.0* ${number_of_completed_orders})/ nullif(${number_of_orders},0) ;;
    value_format_name: percent_2
  }

  measure: number_of_completed_orders {
    type: count_distinct
    label: "Completed Orders"
    description: "Will give unique orders completed"
    sql: ${order_id} ;;
    filters: {
      field: status
      value: "Complete"
    }
  }

  dimension: profit {
    type: number
    label: "Profit"
    description: "Profit calculated by subtracting cost from the sale price"
    sql: ${sale_price}-${inventory_items.cost} ;;
    value_format_name: usd
      }



  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
}
