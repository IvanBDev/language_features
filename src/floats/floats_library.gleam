import gleam/float
import gleam/io.{debug}

pub fn floays_examples_wrapper() {
  // Gleam's numerical operators are not overloaded, so there are dedicated operators for working with floats.

  // Float aritmetics
  debug(2.56 +. 5.89)
  debug(76.635 -. 54.05)
  debug(45.8 *. 3.09)
  debug(32.7 /. 2.78)

  // Float comparisons
  debug(56.12 >. 8.99)
  debug(4.87 <. 4.86)
  debug(69.69 >=. 60.0)
  debug(69.69 <=. 60.0)

  // Equality works for any type
  debug(56.0256 == 56.0256)
  debug(56.0257 == 56.0256)

  // Division by 0 is not an error
  debug(78.45 /. 0.0)

  //Standard library for floats
  debug(float.max(4.89, 54.09))
  debug(float.ceiling(43.87))
}
