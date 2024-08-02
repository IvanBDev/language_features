import blocks/block_library
import data_types/data_type_wrapper
import floats/floats_library
import functions/functions_libarary
import gleam/io
import ints/ints_library
import libraries/library_wrapper
import loops/loops_wrapper
import number_formats/number_formats_library
import opaque_types/opaque_type_library
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
  io.println(".......................................")
  let _ = data_type_wrapper.data_types_wrapper()
  io.println(".......................................")
  let _ = library_wrapper.librarys_wrapper()
  io.println(".......................................")
  opaque_type_library.opaque_type_wrapper()
  io.println(".......................................")
}
