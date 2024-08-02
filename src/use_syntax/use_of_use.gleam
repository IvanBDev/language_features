import gleam/io
import gleam/result

pub type CustomError {
  UsernameError(message: String)
  PasswordError(message: String)
}

//* The use of use (heheh...) in Gleam is for writing in a unindented style callbacks functions
pub fn use_syntax_wrapper() {
  let _ = without_use() |> io.debug
  let _ = with_use() |> io.debug
  let _ = with_use_in_a_block()
}

fn without_use() {
  result.try(get_username(), fn(username) {
    result.try(get_password(), fn(password) {
      result.map(log_in(username, password), fn(greeting) {
        greeting <> ", " <> username
      })
    })
  })
}

//* Is better used when working with asynchronous function and you need to wait the results
fn with_use() {
  use username <- result.try(get_username())
  use password <- result.try(get_password())
  use greeting <- result.map(log_in(username, password))

  greeting <> ", " <> username
}

//* To ensure that your use code works and is as understandable as possible,
//* the right-hand-side ideally should be a function call rather than a pipeline or other expression
//* which is typically more difficult to read.
fn with_use_in_a_block() {
  let block = {
    use username <- result.try(get_username())
    use password <- result.try(get_password())
    use greeting <- result.map(log_in(username, password))

    greeting <> "," <> username
  }

  case block {
    Ok(result) -> io.println(result)
    Error(UsernameError(error)) -> io.println("ERROR: " <> error)
    Error(PasswordError(error)) -> io.println("ERROR: " <> error)
  }
}

// Here are some pretend functions for this example:

fn get_username() -> Result(String, CustomError) {
  // Ok("alice")
  Error(PasswordError("Wrong username"))
}

fn get_password() -> Result(String, CustomError) {
  // Ok("hunter2")
  Error(PasswordError("Wrong password"))
}

fn log_in(_username: String, _password: String) {
  Ok("Welcome")
}
