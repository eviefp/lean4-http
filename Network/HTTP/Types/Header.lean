namespace Network.HTTP.Types

/-- HTTP Header names according to http://www.w3.org/Protocols/rfc2616/rfc2616-sec14.html
-/
inductive Header where
  | Accept
  | AcceptCharset
  | AcceptEncoding
  | AcceptLanguage
  | AcceptRanges
  | Age
  | Allow
  | Authorization
  | CacheControl
  | Connection
  | ContentEncoding
  | ContentLanguage
  | ContentLength
  | ContentLocation
  | ContentMD
  | ContentRange
  | ContentType
  | Date
  | ETag
  | Expect
  | Expires
  | From
  | Host
  | IfMatch
  | IfModifiedSince
  | IfNoneMatch
  | IfRange
  | IfUnmodifiedSince
  | LastModified
  | Location
  | MaxForwards
  | Pragma
  | ProxyAuthenticate
  | ProxyAuthorization
  | Range
  | Referer
  | RetryAfter
  | Server
  | TE
  | Trailer
  | TransferEncoding
  | Upgrade
  | UserAgent
  | Vary
  | Via
  | WWWAuthenticate
  | Warning

/-- HTTP Header names according to http://www.w3.org/Protocols/rfc2616/rfc2616-sec19.html -/
  | ContentDisposition
  | MIMEVersion

/- HTTP Header names according to https://tools.ietf.org/html/rfc6265#section-4 -/
  | Cookie
  | SetCookie

/-- HTTP Header names according to https://tools.ietf.org/html/rfc6454 -/
  | Origin

/-- HTTP Header names according to https://tools.ietf.org/html/rfc7240 -/
  | Prefer
  | PreferenceApplied

def Header.fromString (rawHeader: String) : Option Header :=
  match rawHeader with
  | "Accept" => some Header.Accept
  | "Accept-Charset" => some Header.AcceptCharset
  | "Accept-Encoding" => some Header.AcceptEncoding
  | "Accept-Language" => some Header.AcceptLanguage
  | "Accept-Ranges" => some Header.AcceptRanges
  | "Age" => some Header.Age
  | "Allow" => some Header.Allow
  | "Authorization" => some Header.Authorization
  | "Cache-Control" => some Header.CacheControl
  | "Connection" => some Header.Connection
  | "Content-Encoding" => some Header.ContentEncoding
  | "Content-Language" => some Header.ContentLanguage
  | "Content-Length" => some Header.ContentLength
  | "Content-Location" => some Header.ContentLocation
  | "Content-MD5" => some Header.ContentMD
  | "Content-Range" => some Header.ContentRange
  | "Content-Type" => some Header.ContentType
  | "Date" => some Header.Date
  | "ETag" => some Header.ETag
  | "Expect" => some Header.Expect
  | "Expires" => some Header.Expires
  | "From" => some Header.From
  | "Host" => some Header.Host
  | "If-Match" => some Header.IfMatch
  | "If-Modified-Since" => some Header.IfModifiedSince
  | "If-None-Match" => some Header.IfNoneMatch
  | "If-Range" => some Header.IfRange
  | "If-Unmodified-Since" => some Header.IfUnmodifiedSince
  | "Last-Modified" => some Header.LastModified
  | "Location" => some Header.Location
  | "Max-Forwards" => some Header.MaxForwards
  | "Pragma" => some Header.Pragma
  | "Proxy-Authenticate" => some Header.ProxyAuthenticate
  | "Proxy-Authorization" => some Header.ProxyAuthorization
  | "Range" => some Header.Range
  | "Referer" => some Header.Referer
  | "Retry-After" => some Header.RetryAfter
  | "Server" => some Header.Server
  | "TE" => some Header.TE
  | "Trailer" => some Header.Trailer
  | "Transfer-Encoding" => some Header.TransferEncoding
  | "Upgrade" => some Header.Upgrade
  | "User-Agent" => some Header.UserAgent
  | "Vary" => some Header.Vary
  | "Via" => some Header.Via
  | "WWW-Authenticate" => some Header.WWWAuthenticate
  | "Warning" => some Header.Warning
  | "Content-Disposition" => some Header.ContentDisposition
  | "MIME-Version" => some Header.MIMEVersion
  | "Cookie" => some Header.Cookie
  | "Set-Cookie" => some Header.SetCookie
  | "Origin" => some Header.Origin
  | "Prefer" => some Header.Prefer
  | "Preference-Applied" => some Header.PreferenceApplied
  | _ => none

def Header.toString (header: Header) : String :=
  match header with
  | Header.Accept => "Accept"
  | Header.AcceptCharset => "Accept-Charset"
  | Header.AcceptEncoding => "Accept-Encoding"
  | Header.AcceptLanguage => "Accept-Language"
  | Header.AcceptRanges => "Accept-Ranges"
  | Header.Age => "Age"
  | Header.Allow => "Allow"
  | Header.Authorization => "Authorization"
  | Header.CacheControl => "Cache-Control"
  | Header.Connection => "Connection"
  | Header.ContentEncoding => "Content-Encoding"
  | Header.ContentLanguage => "Content-Language"
  | Header.ContentLength => "Content-Length"
  | Header.ContentLocation => "Content-Location"
  | Header.ContentMD => "Content-MD5"
  | Header.ContentRange => "Content-Range"
  | Header.ContentType => "Content-Type"
  | Header.Date => "Date"
  | Header.ETag => "ETag"
  | Header.Expect => "Expect"
  | Header.Expires => "Expires"
  | Header.From => "From"
  | Header.Host => "Host"
  | Header.IfMatch => "If-Match"
  | Header.IfModifiedSince => "If-Modified-Since"
  | Header.IfNoneMatch => "If-None-Match"
  | Header.IfRange => "If-Range"
  | Header.IfUnmodifiedSince => "If-Unmodified-Since"
  | Header.LastModified => "Last-Modified"
  | Header.Location => "Location"
  | Header.MaxForwards => "Max-Forwards"
  | Header.Pragma => "Pragma"
  | Header.ProxyAuthenticate => "Proxy-Authenticate"
  | Header.ProxyAuthorization => "Proxy-Authorization"
  | Header.Range => "Range"
  | Header.Referer => "Referer"
  | Header.RetryAfter => "Retry-After"
  | Header.Server => "Server"
  | Header.TE => "TE"
  | Header.Trailer => "Trailer"
  | Header.TransferEncoding => "Transfer-Encoding"
  | Header.Upgrade => "Upgrade"
  | Header.UserAgent => "User-Agent"
  | Header.Vary => "Vary"
  | Header.Via => "Via"
  | Header.WWWAuthenticate => "WWW-Authenticate"
  | Header.Warning => "Warning"
  | Header.ContentDisposition => "Content-Disposition"
  | Header.MIMEVersion => "MIME-Version"
  | Header.Cookie => "Cookie"
  | Header.SetCookie => "Set-Cookie"
  | Header.Origin => "Origin"
  | Header.Prefer => "Prefer"
  | Header.PreferenceApplied => "Preference-Applied"

-- TODO: ByteRanges
