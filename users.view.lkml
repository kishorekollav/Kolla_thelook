view: users {
  sql_table_name: PUBLIC.USERS ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."ID" ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}."AGE" ;;
  }

  dimension: age_def {
    label: "Age Category"
    description: "Devided into two categories"
    case: {
      when: {
        sql: ${TABLE}.age < 18 ;;
        label: "Unmatured"
      }
      when: {
        sql: ${TABLE}.age >18 ;;
        label: "Matured"
      }
            else: "unknown"
    }
  }

  dimension: age_groups {
    type: tier
    sql: ${age} ;;
    tiers: [0,18,30,50]
    style: integer
  }

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."FIRST_NAME" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."GENDER" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."LAST_NAME" ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}."LATITUDE" ;;
    sql_longitude:${TABLE}."LONGITUDE" ;;
  }

  #dimension: longitude {
    #type: location
    #sql_longitude:${TABLE}."LONGITUDE" ;;

  #}

  dimension: state {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}."TRAFFIC_SOURCE" ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}."ZIP" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, events.count, order_items.count]
  }
}
