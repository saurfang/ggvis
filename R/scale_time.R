#' Create a date/time scale.
#'
#' A date/time scale controls the mapping of date and time variables to
#' visual properties.
#'
#' Generally, you should create new scales with \code{dscale} because
#' that will automatically set the range to a reasonable default, and it will
#' automatically pick the correct type of scale given the variable type.
#'
#' @inheritParams vega_scale
#' @param clamp  If true, values that exceed the data domain are clamped to
#'   either the minimum or maximum range value.
#' @param nice If specified, modifies the scale domain to use a more
#'   human-friendly value range. Should be a string indicating the desired time
#'   interval; legal values are "second", "minute", "hour", "day", "week",
#'   "month", or "year"
#' @param utc if \code{TRUE}, uses UTC times.
#' @seealso \url{https://github.com/trifacta/vega/wiki/Scales#time-scale-properties}
#' @family vega scales
#' @export
#' @examples
#' set.seed(2934)
#' dat <- data.frame(times = as.POSIXct("2013-07-01", tz = "GMT") +
#'                           rnorm(200) * 60 * 60 * 24 * 7)
#' p <- dat %>% ggvis(x = ~times) %>% layer_histograms()
#' p
#'
#' scale_time("x", nice = "year")
#' p %>% set_dscale("x", "datetime", nice = "year")
#'
#' scale_time("x", utc = TRUE)
#' p %>% set_dscale("x", "datetime", utc = TRUE)
scale_time <- function(name, utc = FALSE, clamp = FALSE, nice = NULL,
                       domain = NULL, range = NULL, reverse = FALSE,
                       round = FALSE) {
  assert_that(is.flag(clamp))
  if (!is.null(nice)) {
    nice <- match.arg(nice, c("second", "minute", "hour", "day", "week",
      "month", "year"))
  }

  vega_scale(name, if (utc) "utc" else "time", subclass = "time",
    clamp = clamp, nice = nice, domain = domain, range = range,
    reverse = reverse, round = round)
}
