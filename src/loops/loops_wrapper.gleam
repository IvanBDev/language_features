import gleam/io

pub fn loops_wrapper() {
  io.println("Recursion - Factorial function")
  recursion_function(root: 7)
  io.println("Tail Call Recursion - Factorial function")
  io.debug(tail_call_recursion_function(root: 5))
  io.println("------------------------------------------")
  io.println("List recursion")
  io.debug(list_recursion_function())
  io.println("------------------------------------------")
  io.println("Finding the greater number from a list")
  io.print("List: ")
  io.debug([18, 56, 58_980_345, 400, 85, 9000, 37, 91, 40_000])
  io.debug(
    find_the_biggest_number([18, 56, 58_980_345, 400, 85, 9000, 37, 91, 40_000]),
  )
}

fn recursion_function(root number: Int) -> Int {
  case number {
    0 | 1 -> 1
    number -> number * recursion_function(number - 1)
  }
  |> io.debug
}

fn tail_call_recursion_function(root number: Int) -> Int {
  recursion_function_v2(root: number, accumulator: 1)
}

fn recursion_function_v2(root number: Int, accumulator acc: Int) -> Int {
  // io.debug(number * acc)
  case number {
    0 | 1 -> acc
    number -> recursion_function_v2(number - 1, number * acc)
  }
}

fn list_recursion_function() -> Int {
  let list: List(Int) = [18, 56, 35, 85, 91]
  let total: Int = 0
  let sum_function = sum_function(lista: list, totale: total)

  sum_function
}

fn sum_function(lista list: List(Int), totale total: Int) -> Int {
  case list {
    // Pattern similar of [n, ..] but in this case n is the first element of the list and is put inside the variable 'first'
    // and the rest of the list is put inside the variable 'rest'
    [first, ..rest] -> {
      // io.println("printing the variable first: ")
      // io.debug(first)
      // io.println("printing the variable rest: ")
      // io.debug(rest)

      sum_function(rest, total + first)
    }
    [] -> total
  }
}

fn find_the_biggest_number(lista list: List(Int)) -> Int {
  greater_number(list, 0)
}

fn greater_number(lista list: List(Int), accumulatore acc: Int) -> Int {
  // [18, 56, 400, 85, 9000, 37, 91]
  case list {
    [first_element_list, ..rest] -> {
      let numero_piu_grande = first_element_list

      let appoggio = {
        case rest {
          [first_of_rest, ..] -> {
            case numero_piu_grande >= first_of_rest {
              True -> numero_piu_grande
              False -> first_of_rest
            }
          }
          [] -> 0
        }
      }

      let output = {
        case acc >= appoggio {
          True -> acc
          False -> appoggio
        }
      }

      greater_number(rest, output)
    }
    [] -> acc
  }
}
