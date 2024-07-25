import gleam/int
import gleam/io
import gleam/list

pub fn functions_wrapper() {
  case_expressione_function()
  string_pattern_function()
  list_pattern_function()
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

fn list_pattern_function() {
  io.println("List Patterns:")
  let list: List(Int) =
    list.repeat(int.random(11), times: int.random(4)) |> io.debug

  case list {
    // [] = empty list
    [] -> "The list is empty"
    // [n] a list with only n
    [4] -> "List of just 4"
    // [n, ..] a list that starts with n and with any other elements
    [7, ..] -> "A list that starts with a 7 and matches the rest"
    // [_, _] a list with only 2 elements
    [_, _] -> "A list with only 2 elements"
    // [_, _, ..] a list that have at least 2 elements and with any other elements
    [_, _, ..] -> "A list that has at least 2 elements"
    _ -> "Any other list"
  }
  |> io.println
}
