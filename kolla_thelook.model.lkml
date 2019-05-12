connection: "thelook"

# include all the views
include: "*.view"

datagroup: kolla_thelook_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "4 hour"
}

persist_with: kolla_thelook_default_datagroup

explore: etl_jobs {}

explore: events {
  join: users {
    type: inner
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}


explore: inventory_items {
  sql_always_where: ${created_date} >= '2017-01-01';;
  join: products {
    view_label: "Product Info"
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    view_label: "Distributions Info"
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  always_filter: {
    filters: {
      field: sale_price
      value: "10"
    }
  }
  join: users {
    type: left_outer
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one


  }
  join: users_again {
    from: users
    type: left_outer
    sql_on: ${order_items.user_id} = ${users_again.id} ;;
    relationship: many_to_one
  }

  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: distribution_centers {
    type: left_outer
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    relationship: many_to_one
  }
}

explore: distribution_centers{
  join: order_items {
    sql_on: ${distribution_centers.id}.id} = ${order_items.id} ;;
    relationship: many_to_one
  }
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
}
}

explore: products {

  join: distribution_centers {
    sql_on: ${products.distribution_center_id} = ${distribution_centers.id} ;;
    fields: [name]
    relationship: many_to_one
  }
}

explore: users {}
