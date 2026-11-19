# Skapar en mapp för en TidyTuesday-vecka och sparar datan lokalt som CSV.
#
# datum: veckans tisdag som "ÅÅÅÅ-MM-DD", t.ex. "2026-11-18"
# amne:  kort namn på veckans tema, används i mappnamnet
ny_vecka <- function(datum, amne) {
  mapp <- here::here(substr(datum, 1, 4), paste0(datum, "_", amne))
  dir.create(file.path(mapp, "data"),    recursive = TRUE, showWarnings = FALSE)
  dir.create(file.path(mapp, "figurer"), recursive = TRUE, showWarnings = FALSE)
  
  tt <- tidytuesdayR::tt_load(datum)
  for (namn in names(tt)) {
    readr::write_csv(tt[[namn]], file.path(mapp, "data", paste0(namn, ".csv")))
  }
  message("Skapade ", mapp)
  invisible(mapp)
}