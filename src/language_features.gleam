import floats/floats_library
import gleam/io
import ints/ints_library

pub fn main() {
  io.println("Example project starts here")
  ints_library.int_examples_wrapper()
  io.println(".......................................")
  floats_library.floays_examples_wrapper()
}
//private function
// fn type_checking_error() {
//   io.print("errore type checking: ")
//   //Error - expected int
//   // io.println(4)
//   //Expected
//   io.println("7")
// }
