% Generated by roxygen2 (4.0.0): do not edit by hand
\name{input_text}
\alias{input_numeric}
\alias{input_text}
\title{Create an interactive text or numeric input box.}
\usage{
input_text(value, label = "", id = rand_id("text_"), map = identity)

input_numeric(value, label = "", id = rand_id("numeric_"), map = identity)
}
\arguments{
\item{value}{Initial value}

\item{label}{Display label for the control}

\item{id}{A unique identifier for this input. Usually generated
automatically.}

\item{map}{A function with single argument \code{x}, the value of the
control on the client. Returns a modified value.}
}
\description{
\code{input_numeric} only allows numbers and comes with a spin box control.
\code{input_text} allows any type of input.
}
\examples{
fill_text <- input_text(label = "Point color", value = "red")
mtcars \%>\% qvis(~wt, ~mpg, fill := fill_text)

size_num <- input_numeric(label = "Point size", value = 25)
mtcars \%>\% qvis(~wt, ~mpg, size := size_num)
}
\seealso{
Other interactive input: \code{\link{input_checkboxgroup}},
  \code{\link{input_radiobuttons}},
  \code{\link{input_select}}; \code{\link{input_checkbox}};
  \code{\link{input_slider}}
}

