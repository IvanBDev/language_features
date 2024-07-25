import gleam/io

pub fn loops_wrapper() {
  io.println("Recursion - Factorial function")
  recursion_function(root: 7)
  io.debug(tail_call_recursion_function(root: 5))
}

fn recursion_function(root number: Int) -> Int {
  case number {
    0 | 1 -> 1
    number -> number * recursion_function(number - 1)
  }
  |> io.debug
}

fn tail_call_recursion_function(root number: Int) {
  recursion_function_v2(root: number, accumulator: 1)
}

fn recursion_function_v2(root number: Int, accumulator acc: Int) -> Int {
  io.debug(number * acc)
  case number {
    0 | 1 -> acc
    number -> recursion_function_v2(number - 1, number * acc)
  }
}
