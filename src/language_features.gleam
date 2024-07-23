import floats/floats_library
import gleam/io
import ints/ints_library
import number_formats/number_formats_library
import variables/variables_library

pub fn main() {
  io.println("Example project starts here")
  ints_library.int_examples_wrapper()
  io.println(".......................................")
  floats_library.floays_examples_wrapper()
  io.println(".......................................")
  number_formats_library.number_formats_wrapper()
  io.println(".......................................")
  variables_library.variables_wrapper()
}
//private function
// fn type_checking_error() {
//   io.print("errore type checking: ")
//   //Error - expected int
//   // io.println(4)
//   //Expected
//   io.println("7")
// }
