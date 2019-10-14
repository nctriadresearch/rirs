#' Get IRS SOI Tax Stats - County Data
#'
#' @description A function to download tax stats
#' @param year the year
#' @param state of interest
#' @source https://www.irs.gov/statistics/soi-tax-stats-county-data
#' @export

get_soi <- function(year, state, msa = FALSE){

	if(msa){
		irs_url <- paste0("https://www.irs.gov/pub/irs-soi/",year,"incbsa.csv")

		temp_file <- tempfile(fileext = ".csv")

		download.file(irs_url, temp_file)

		out <- readr::read_csv(temp_file)

		out <- out[ -c(1:2),]

		unlink(temp_file)


	} else{
		irs_url <- paste0("https://www.irs.gov/pub/irs-soi/",year,"incy",state,".xls")

		temp_file <- tempfile(fileext = ".xls")

		download.file(irs_url, temp_file)

		out <- readxl::read_excel(temp_file, skip = 3)

		out <- out[ -c(1:2),]

		unlink(temp_file)
	}





	out

}
get_soi(year = "16", state = "bleh",msa = TRUE)
