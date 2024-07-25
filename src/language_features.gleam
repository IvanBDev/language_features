import blocks/block_library
import floats/floats_library
import functions/functions_libarary
import gleam/io
import ints/ints_library
import loops/loops_wrapper
import number_formats/number_formats_library
import variables/variables_library

pub fn main() {
  io.println("Example project starts here")
  ints_library.int_examples_wrapper()
  io.println(".......................................")
  floats_library.floats_examples_wrapper()
  io.println(".......................................")
  number_formats_library.number_formats_wrapper()
  io.println(".......................................")
  variables_library.variables_wrapper()
  io.println(".......................................")
  block_library.block_wrapper()
  io.println(".......................................")
  functions_libarary.functions_wrapper()
  io.println(".......................................")
  loops_wrapper.loops_wrapper()
}
