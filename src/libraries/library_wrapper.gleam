import gleam/dict
import gleam/float
import gleam/int
import gleam/io
import gleam/list
import gleam/result

pub fn librarys_wrapper() {
  io.println("Gleam libraries examples:")
  let _ = list_module_examples()
  io.println("-----------------------------")
  let _ = result_module_examples()
  io.println("-----------------------------")
  dict_module_example()
}

fn list_module_examples() {
  let ints = [0, 1, 2, 3, 4, 5]
  io.println("Original list:")
  io.debug(ints)

  io.println("=== map ===")
  let _ = io.debug(list.map(ints, fn(x) { x * 2 }))

  io.println("=== filter ===")
  let _ = io.debug(list.filter(ints, fn(x) { x % 2 == 0 }))

  io.println("=== fold ===")
  let _ = io.debug(list.fold(ints, 0, fn(count, e) { count + e }))

  io.println("=== find ===")
  let _ = io.debug(list.find(ints, fn(x) { x > 3 }))
  let _ = io.debug(list.find(ints, fn(x) { x > 13 }))
}

fn result_module_examples() {
  io.println("=== map ===")
  let _ = io.debug(result.map(Ok(4), fn(x) { x * 2 }))
  let _ = io.debug(result.map(Error(6), fn(x) { x * 2 }))

  io.println("=== try ===")
  let _ = io.debug(result.try(Ok("1"), int.parse))
  let _ = io.debug(result.try(Ok("7.5"), float.parse))
  let _ = io.debug(result.try(Error(Nil), int.parse))

  io.println("=== unwrap ===")
  let _ = io.debug(result.unwrap(Ok("1234"), "default"))
  let _ = io.debug(result.unwrap(Error(Nil), "default"))

  io.println("=== pipeline ===")
  let _ =
    int.parse("-1234")
    |> result.map(int.absolute_value)
    |> result.try(int.remainder(_, 42))
    |> io.debug
}

fn dict_module_example() {
  let scores = dict.from_list([#("Lucy", 13), #("Drew", 15)])
  io.debug(scores)

  let scores =
    scores
    |> dict.insert("Bushra", 16)
    |> dict.insert("Darius", 14)
    |> dict.delete("Drew")
    |> io.debug

  let increment_key_by_ten = fn(x) { Ok(x + 10) }

  let _ =
    scores
    |> dict.get("Lucy")
    |> result.try(increment_key_by_ten)
    |> io.debug
}
