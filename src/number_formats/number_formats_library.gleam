import gleam/float
import gleam/int
import gleam/io

pub fn number_formats_wrapper() {
  //For readability purpose it can be use the _ symbol
  // Underscore
  io.println("Underscores: ")
  io.println("1_000_000 -> " <> int.to_string(1_000_000))
  io.println("10_000.01 -> " <> float.to_string(10_000.01))

  // Binary, octal, and hex Int literals
  io.println("Binary: ")
  io.println("0b0010111101" <> " -> " <> int.to_string(0b0010111101))
  io.println("Octal: ")
  io.println("0o17" <> " -> " <> int.to_string(0o17))
  io.println("Hex: ")
  io.println("0x46ACF" <> " -> " <> int.to_string(0x46ACF))
}
