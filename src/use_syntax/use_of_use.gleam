import gleam/io
import gleam/result

// The use of use (heheh...) in Gleam is for writing in a unindented style callbacks functions
pub fn use_syntax_wrapper() {
  let _ = without_use() |> io.debug
  let _ = with_use() |> io.debug
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

fn with_use() {
  use username <- result.try(get_username())
  use password <- result.try(get_password())
  use greeting <- result.map(log_in(username, password))

  greeting <> ", " <> username
}

// Here are some pretend functions for this example:

fn get_username() {
  Ok("alice")
}

fn get_password() {
  Error("hunter2")
}

fn log_in(_username: String, _password: String) {
  Ok("Welcome")
}
