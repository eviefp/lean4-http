namespace Network.HTTP.Types

/-- Version major minor -/
inductive Version  where
  | Http09
  | Http10
  | Http11
  | Http20

def Version.toString : Version -> String
  | Http09 => "HTTP/0.9"
  | Http10 => "HTTP/1.0"
  | Http11 => "HTTP/1.1"
  | Http20 => "HTTP/2.0"

def Version.fromString : String -> Option Version
  | "HTTP/0.9" => some Http09
  | "HTTP/1.0" => some Http10
  | "HTTP/1.1" => some Http11
  | "HTTP/2.0" => some Http20
  |  _ => none
