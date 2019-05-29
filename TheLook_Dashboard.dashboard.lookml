- dashboard: the_events_look_dashboard
  title: The Events Look Dashboard
  layout: newspaper
  elements:
  - title: Products by Category
    name: Products by Category
    model: kolla_thelook
    explore: order_items
    type: looker_column
    fields: [products.category, products.count]
    filters:
      order_items.sale_price: ">10"
    sorts: [products.count desc]
    limit: 500
    series_types: {}
    listen:
      Country: users_again.country
      Year: users.created_year
    row: 2
    col: 0
    width: 8
    height: 6
  - title: Orders by Age group
    name: Orders by Age group
    model: kolla_thelook
    explore: order_items
    type: looker_pie
    fields: [users.age_groups, order_items.count]
    fill_fields: [users.age_groups]
    filters:
      order_items.sale_price: ">10"
    sorts: [users.age_groups]
    limit: 500
    series_types: {}
    listen:
      Country: users_again.country
      Year: inventory_items.created_year
    row: 14
    col: 0
    width: 8
    height: 6
  - title: Sales by Region
    name: Sales by Region
    model: kolla_thelook
    explore: order_items
    type: looker_map
    fields: [users.location, order_items.Sum]
    filters:
      order_items.sale_price: ">10"
    sorts: [order_items.Sum desc]
    limit: 500
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 43.77109381775651
    map_longitude: -60.90820312500001
    map_zoom: 3
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen:
      Country: users_again.country
      Year: order_items.created_year
    row: 6
    col: 8
    width: 8
    height: 6
  - title: Total Orders by Order created date
    name: Total Orders by Order created date
    model: kolla_thelook
    explore: order_items
    type: looker_area
    fields: [order_items.created_month, order_items.Sum]
    fill_fields: [order_items.created_month]
    filters:
      order_items.sale_price: '10'
    sorts: [order_items.created_month desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Country: users_again.country
      Year: inventory_items.created_year
    row: 6
    col: 16
    width: 8
    height: 6
  - title: Returned Orders by Age group - Yearly summary
    name: Returned Orders by Age group - Yearly summary
    model: kolla_thelook
    explore: order_items
    type: looker_column
    fields: [users.age_groups, order_items.returned_year, order_items.count]
    pivots: [users.age_groups]
    fill_fields: [users.age_groups, order_items.returned_year]
    filters:
      order_items.sale_price: ">10"
    sorts: [users.age_groups, order_items.returned_year desc]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Country: users_again.country
      Year: inventory_items.created_year
    row: 0
    col: 8
    width: 8
    height: 6
  - title: Sales Vs Profit
    name: Sales Vs Profit
    model: kolla_thelook
    explore: order_items
    type: looker_scatter
    fields: [order_items.sale_price, order_items.profit]
    filters:
      order_items.sale_price: ">0"
    sorts: [order_items.sale_price]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    swap_axes: true
    show_null_points: true
    listen:
      Country: users_again.country
      Year: inventory_items.created_year
    row: 8
    col: 0
    width: 8
    height: 6
  - title: Products Sales
    name: Products Sales
    model: kolla_thelook
    explore: order_items
    type: table
    fields: [products.category, inventory_items.product_name, order_items.Sum]
    filters:
      order_items.sale_price: ">10"
    sorts: [order_items.Sum desc]
    limit: 500
    query_timezone: America/Los_Angeles
    row: 0
    col: 16
    width: 8
    height: 6
  - title: Completed Orders By Year
    name: Completed Orders By Year
    model: kolla_thelook
    explore: order_items
    type: looker_line
    fields: [order_items.created_year, order_items.number_of_completed_orders]
    fill_fields: [order_items.created_year]
    filters:
      order_items.sale_price: ">10"
    sorts: [order_items.created_year desc]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    row: 12
    col: 8
    width: 8
    height: 6
  - title: Total Sales
    name: Total Sales
    model: kolla_thelook
    explore: order_items
    type: single_value
    fields: [order_items.Sum]
    filters:
      order_items.sale_price: ">10"
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    listen: {}
    row: 0
    col: 0
    width: 8
    height: 2
  - title: Brands - Most Orders
    name: Brands - Most Orders
    model: kolla_thelook
    explore: order_items
    type: looker_wordcloud
    fields: [products.brand, products.count]
    filters:
      order_items.sale_price: ">10"
    sorts: [products.count desc]
    limit: 500
    query_timezone: America/Los_Angeles
    series_types: {}
    row: 12
    col: 16
    width: 8
    height: 6
  filters:
  - name: Country
    title: Country
    type: field_filter
    default_value: USA
    allow_multiple_values: true
    required: false
    model: kolla_thelook
    explore: order_items
    listens_to_filters: []
    field: users_again.country
  - name: Year
    title: Year
    type: number_filter
    default_value: ''
    allow_multiple_values: true
    required: false
