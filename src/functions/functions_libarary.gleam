import gleam/int
import gleam/io

pub fn functions_wrapper() {
  case_expressione_function()
  string_pattern_function()
}

fn case_expressione_function() -> String {
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

  io.debug(result)
}

fn string_pattern_function() {
  io.println("String Pattern:")

  get_name("Hello, Ivan")
  get_name("Hello, Mario")
  get_name("Hello, Franci")
  get_name("System still working?")
}

fn get_name(input: String) -> String {
  io.println("Input string: " <> input)
  let result: String = case input {
    "Hello, " <> name -> name
    _ -> "Unknown"
  }

  io.debug(result)
}
