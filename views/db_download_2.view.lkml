# If necessary, uncomment the line below to include explore_source.
# include: "heatmapbugtest.model.lkml"

view: db_download_2 {
  derived_table: {
    explore_source: orders {
      column: status {}
      column: count {}
    }
  }
  dimension: status {}
  dimension: count {
    type: number
  }
}
