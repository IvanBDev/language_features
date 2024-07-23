import gleam/io

pub fn variables_wrapper() {
  //Variables
  let string_variable: String = "variabile stringa"
  let int_variable: Int = 7
  let float_variable: Float = 0.4
  let boolean_variable: Bool = True

  //Common practis to use _ before the variable name to let know Gleam that variable is never used so will not throw a warning
  let _unused_variable: String = "unused variable"

  //Print variables
  io.println("Varibles: ")
  io.println("string_variable: " <> string_variable)
  io.debug(int_variable)
  io.debug(float_variable)
  io.debug(boolean_variable)

  //Assigning a the value of string_variable to another_string_value
  let another_string_value: String = string_variable
  io.println(
    "assigning string_value to another_string_value: " <> another_string_value,
  )

  //Changing the value of string_value
  let string_value = "A brand new value"
  io.println("changing the value to string_value: " <> string_value)

  io.println("print of another_string_value: " <> another_string_value)
}
