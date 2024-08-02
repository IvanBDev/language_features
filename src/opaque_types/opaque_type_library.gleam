import gleam/int
import gleam/io
import gleam/regex.{Options}
import gleam/string

pub opaque type OUser {
  OUser(
    id: Result(Int, ErrorWrapper),
    username: Result(String, ErrorWrapper),
    email: Result(String, ErrorWrapper),
  )
}

fn new(id id: Int, username username: String, email email: String) -> OUser {
  let email_regex_options = Options(case_insensitive: True, multi_line: False)
  let regex_for_email =
    regex.compile(
      "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
      email_regex_options,
    )

  let is_email_valid: Bool = case regex_for_email {
    Ok(re) -> regex.check(re, email)
    Error(_) -> False
  }

  let id_for_new: Result(Int, ErrorWrapper) = case id > 0 {
    True -> Ok(id)
    False ->
      Error(IdNotValid(
        "The inserted ID [" <> int.to_string(id) <> "] is not a valid ID",
      ))
  }

  let username_for_mew: Result(String, ErrorWrapper) = case
    string.length(username) > 3
  {
    True -> Ok(username)
    False -> Error(UsernameLenghtNotValid(string.length(username)))
  }

  let email_for_new: Result(String, ErrorWrapper) = case is_email_valid {
    True -> Ok(email)
    False ->
      Error(EmailNotValid("The email [" <> email <> "] is not a valid email"))
  }

  OUser(id_for_new, username_for_mew, email_for_new)
}

pub type ErrorWrapper {
  IdNotValid(message: String)
  UsernameLenghtNotValid(lenght_used: Int)
  EmailNotValid(message: String)
}

pub fn constructor(
  id id: Int,
  username username: String,
  email email: String,
) -> OUser {
  new(id, username, email)
}

pub fn opaque_type_wrapper() {
  let input_username = "IvanBDev"
  let input_email = "i.bendo@gmail.com"
  let _ = new(-3, input_username, input_email) |> io.debug
}
