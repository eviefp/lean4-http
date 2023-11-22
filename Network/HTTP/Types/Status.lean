namespace Network.HTTP.Types

inductive Status where
  -- 1xx
  | Continue
  | SwitchingProtocols

  -- 2xx
  | Ok
  | Created
  | Accepted
  | NonAuthorative
  | NoContent
  | ResetContent
  | PartialContent

  -- 3xx
  | MultipleChoices
  | MovedPermanently
  | Found
  | SeeOther
  | NotModified
  | UseProxy
  | TemporaryRedirect
  | PermanentRedirect

  -- 4xx
  | BadRequest
  | Unauthorized
  | PaymentRequired
  | Forbidden
  | NotFound
  | MethodNotAllowed
  | NotAcceptable
  | ProxyAuthenticationRequired
  | RequestTimeout
  | Conflict
  | Gone
  | LengthRequired
  | PreconditionFailed
  | RequestEntityTooLarge
  | RequestURITooLong
  | UnsupportedMediaType
  | RequestedRangeNotSatisfiable
  | ExpectationFailed
  | ImATeapot
  | UnprocessableEntity
  | UpgradeRequired
  | PreconditionRequired
  | TooManyRequests
  | RequestHeaderFieldsTooLarge

  -- 5xx
  | InternalServerError
  | NotImplemented
  | BadGateway
  | ServiceUnavailable
  | GatewayTimeout
  | HTTPVersionNotSupported
  | NetworkAuthenticationRequired

  -- other
  | Custom : (code : Nat) -> (message: String) -> Status


def Status.code : Status -> Nat
  | Continue => 100
  | SwitchingProtocols => 101
  | Ok => 200
  | Created => 201
  | Accepted => 202
  | NonAuthorative => 203
  | NoContent => 204
  | ResetContent => 205
  | PartialContent => 206
  | MultipleChoices => 300
  | MovedPermanently => 301
  | Found => 302
  | SeeOther => 303
  | NotModified => 304
  | UseProxy => 305
  | TemporaryRedirect => 307
  | PermanentRedirect => 308
  | BadRequest => 400
  | Unauthorized => 401
  | PaymentRequired => 402
  | Forbidden => 403
  | NotFound => 404
  | MethodNotAllowed => 405
  | NotAcceptable => 406
  | ProxyAuthenticationRequired => 407
  | RequestTimeout => 408
  | Conflict => 409
  | Gone => 410
  | LengthRequired => 411
  | PreconditionFailed => 412
  | RequestEntityTooLarge => 413
  | RequestURITooLong => 414
  | UnsupportedMediaType => 415
  | RequestedRangeNotSatisfiable => 416
  | ExpectationFailed => 417
  | ImATeapot => 418
  | UnprocessableEntity => 422
  | UpgradeRequired => 426
  | PreconditionRequired => 428
  | TooManyRequests => 429
  | RequestHeaderFieldsTooLarge => 431
  | InternalServerError => 500
  | NotImplemented => 501
  | BadGateway => 502
  | ServiceUnavailable => 503
  | GatewayTimeout => 504
  | HTTPVersionNotSupported => 505
  | NetworkAuthenticationRequired => 511
  | Custom code _ => code

def Status.message : Status -> String
  | Continue => "Continue"
  | SwitchingProtocols => "Switching Protocols"
  | Ok => "OK"
  | Created => "Created"
  | Accepted => "Accepted"
  | NonAuthorative => "Non-Authorative Information"
  | NoContent => "No Content"
  | ResetContent => "Reset Content"
  | PartialContent => "Partial Content"
  | MultipleChoices => "Multiple Choices"
  | MovedPermanently => "Moved Permanently"
  | Found => "Found"
  | SeeOther => "See Other"
  | NotModified => "Not Modified"
  | UseProxy => "Use Proxy"
  | TemporaryRedirect => "Temporary Redirect"
  | PermanentRedirect => "Permanent Redirect"
  | BadRequest => "Bad Request"
  | Unauthorized => "Unauthorized"
  | PaymentRequired => "Payment Required"
  | Forbidden => "Forbidden"
  | NotFound => "Not Found"
  | MethodNotAllowed => "Method Not Allowed"
  | NotAcceptable => "Not Acceptable"
  | ProxyAuthenticationRequired => "Proxy Authentication Required"
  | RequestTimeout => "Request Timeout"
  | Conflict => "Conflict"
  | Gone => "Gone"
  | LengthRequired => "Length Required"
  | PreconditionFailed => "Precondition Failed"
  | RequestEntityTooLarge => "Request Entity Too Large"
  | RequestURITooLong => "Request-URI Too Long"
  | UnsupportedMediaType => "Unsupported Media Type"
  | RequestedRangeNotSatisfiable => "Requested Range Not Satisfiable"
  | ExpectationFailed => "Expectation Failed"
  | ImATeapot => "I'm a teapot"
  | UnprocessableEntity => "Unprocessable Entity"
  | UpgradeRequired => "Upgrade Required"
  | PreconditionRequired => "Precondition Required"
  | TooManyRequests => "Too Many Requests"
  | RequestHeaderFieldsTooLarge => "Request Header Fields Too Large"
  | InternalServerError => "Internal Server Error"
  | NotImplemented => "Not Implemented"
  | BadGateway => "Bad Gateway"
  | ServiceUnavailable => "Service Unavailable"
  | GatewayTimeout => "Gateway Timeout"
  | HTTPVersionNotSupported => "HTTP Version Not Supported"
  | NetworkAuthenticationRequired => "Network Authentication Required"
  | Custom _ message => message

def Status.toString (status: Status) : String := s!"{status.code} {status.message}"
