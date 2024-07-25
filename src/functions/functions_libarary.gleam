import gleam/int
import gleam/io

pub fn functions_wrapper() {
  case_expressione_function()
}

fn case_expressione_function() {
  io.println("Case Expression:")
  let random_number: Int = int.random(11)

  let result = case random_number {
    0 | 1 -> "SaS"
    3 | 4 -> "SeS"
    6 | 7 -> "SiS"
    9 | 10 -> "SoS"
    // Like the default in Java - this matches any other cases
    random_number -> int.to_string(random_number)
  }

  result
}
