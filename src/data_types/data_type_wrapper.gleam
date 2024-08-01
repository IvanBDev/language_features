import gleam/int
import gleam/io
import gleam/option.{type Option, None, Some}

// Example of a Type
type Season {
  Spring
  Summer
  Autumn
  Winter
}

// Example of a arecord - Equivalent of a Java Object ---------------
// If you create a varinat you can access ONLY the fields in common, the others will throw an error
pub type TUser {
  // There aren't fields in a Record only constructord with fields
  // Constructor
  UserData(id: Int, name: String, email: String, address: #(String, Int))
}

pub type TStrictUser {
  TinyUser(name: String, surname: String)
}

pub type TOptionalUser {
  OptionalUserData(
    id: Int,
    name: String,
    email: String,
    address: Option(#(String, Int)),
  )
}

pub fn data_types_wrapper() {
  tuples_and_triples_example()
  io.println("------------------------------------------")
  io.debug("Winter: " <> custom_types(Winter))
  io.debug("Spring: " <> custom_types(Spring))
  io.debug("Summer: " <> custom_types(Summer))
  io.debug("Autumn: " <> custom_types(Autumn))
  io.println("------------------------------------------")
  record_example()
  io.println("------------------------------------------")
  option_type_examples()
}

fn tuples_and_triples_example() {
  // A tuple (equivalent of a Map in Java) is defined by #(value1, value2). You can define more values, is not restricted to two or three
  // It's type is auto-infereted
  io.print("Tuple: ")
  let tuple = #("Giog", 22)
  io.debug(tuple)
  io.print("Triple: ")
  let triple = #(4.56, 60, "valore") |> io.debug

  // If you want to take only some values in other variables
  let #(a, _, _) = triple
  io.debug(a)
  // Accessing values from tuples/triples/etc.. is [variable].0 for first, [variable].1 for second, etc...
  io.debug(triple.1)
}

fn custom_types(season season: Season) {
  case season {
    season if season == Summer -> "I HATE YOU SUMMER!!! 😡"
    _ -> "This season is cool 😎"
  }
}

fn record_example() {
  let users: List(TUser) = [
    UserData(1, "Ivan", "i.bendo@gmail.com", #("Via XXXXX", int.random(1000))),
    UserData(2, "Francesco", "f.parisi@gmail.com", #(
      "Via XXXXX",
      int.random(1000),
    )),
    UserData(3, "Fabrizio", "f.monti@gmail.com", #(
      "Via XXXXX",
      int.random(1000),
    )),
  ]

  let tiny_user = TinyUser("Eroz", "Fabbriz")

  io.println("Examples of a Record: ")
  io.debug(users)

  io.println(
    "Accessing fields of a record ([record].field): " <> tiny_user.name,
  )
  io.println("Same example but with recursion:")
  for_loop_user_data(utenti: users)

  io.println("Updating a record:")
  io.println("Before: " <> tiny_user.name <> " " <> tiny_user.surname)
  // Unfortunatly (?) Records are also immutable
  // so you actually create a copy of a Record and change what you need and put the result in a new variable
  let tiny_user_updated: TStrictUser = TinyUser(..tiny_user, surname: "Fabbri")
  io.println(
    "After: " <> tiny_user_updated.name <> " " <> tiny_user_updated.surname,
  )
}

fn for_loop_user_data(utenti users: List(TUser)) -> Nil {
  case users {
    // !! Attention !! the pattern matching must reflect the constructor
    [UserData(_, name, ..), ..rest] -> {
      io.debug(name)
      for_loop_user_data(rest)
    }
    [] -> Nil
  }
}

fn option_type_examples() {
  // This is the way to use an Option type
  let optional_user_with_address: TOptionalUser =
    OptionalUserData(
      5,
      "Federico",
      "f.federichi@gmail.com",
      Some(#("Via XXXXX", int.random(1000))),
    )

  let optional_user_without_address: TOptionalUser =
    OptionalUserData(6, "Gladio", "g.fossetti@gmail.com", None)

  let list: List(TOptionalUser) = [
    optional_user_with_address,
    optional_user_without_address,
  ]

  trying_loops_with_optional(lista: list)
}

fn trying_loops_with_optional(lista list: List(TOptionalUser)) -> Nil {
  case list {
    [element, ..rest] if element.address == None -> {
      io.println("This user: " <> element.name <> " does't have an address")
      trying_loops_with_optional(rest)
    }
    [element, ..rest] -> {
      let tuple_converted = {
        let app = option.unwrap(element.address, #("", 0))
        app.0 <> " " <> int.to_string(app.1)
      }
      io.println(
        "The user: " <> element.name <> " have the address: " <> tuple_converted,
      )
      trying_loops_with_optional(rest)
    }
    [] -> Nil
  }
}
