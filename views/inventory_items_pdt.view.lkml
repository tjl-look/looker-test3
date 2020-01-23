# If necessary, uncomment the line below to include explore_source.
# include: "heatmapbugtest.model.lkml"

view: inventory_items_pdt {
  derived_table: {
    datagroup_trigger: datagroup
    explore_source: inventory_items {
      column: cost {}
      column: created_date {}
      column: created_quarter {}
      column: created_month {}
      column: count {}
    }
  }
  dimension: cost {
    type: number
  }
  dimension: created_date {
    type: date
  }
  dimension: created_quarter {
    type: date_quarter
  }
  dimension: created_month {
    type: date_month
  }
  dimension: count {
    type: number
  }
}
