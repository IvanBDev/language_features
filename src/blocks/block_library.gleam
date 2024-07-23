import gleam/int
import gleam/io

pub fn block_wrapper() {
  // Example of a block (one/more expression grouped together with curly braces)
  // so all of that goes in the inner block, which goes in the variable
  io.println("Blocks:")
  let fahrenheit = {
    let min_random = int.random(-1000) |> io.debug()
    let max_random = int.random(1000) |> io.debug()
    let average_random =
      { max_random + min_random } / 2
      |> int.clamp(min_random, max_random)
      |> io.debug()

    average_random
    //Equivalent of a return in Java
  }

  let celsius = { fahrenheit - 32 } * 5 / 9
  io.println(int.to_string(celsius) <> "°C")
}
