import gleam/int
import gleam/io.{debug}

pub fn int_examples_wrapper() {
  // Int aritmetics
  debug(1 + 1)
  debug(5 - 1)
  debug(30 * 45)
  debug(65 / 5)
  debug(5 % 2)

  //Int comparisons
  debug(4 > 3)
  debug(7 < 10)
  debug(17 >= 17)
  debug(34 <= 22)

  //Equality works with any type
  debug(69 == 69)
  debug(7 == 10)

  // Standard library int function
  debug(int.max(45, 2000))
  //Your number, min and max accettable -> return min if yn < min, max if yn > max or min <= yn <= max
  debug(int.clamp(201, 30, 200))
}
