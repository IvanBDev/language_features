import gleam/int
import gleam/io

pub fn functions_wrapper() {
  case_expressione_function()
}

fn case_expressione_function() {
  io.println("Case Expression:")
  let random_number: Int = int.random(11)

  let result = case random_number {
    0 | 1 -> io.println("SaS")
    3 | 4 -> io.println("SeS")
    6 | 7 -> io.println("SiS")
    9 | 10 -> io.println("SoS")
    // Like the default in Java
    _ -> io.println(int.to_string(random_number))
  }

  result
}
