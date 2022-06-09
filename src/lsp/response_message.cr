require "json"
require "./message"

module LSP
  abstract class ResponseMessage(T)
    include Message
    include JSON::Serializable

    property id : (Int32 | String)?

    #	The result of a request. This member is REQUIRED on success.
    #	This member MUST NOT exist if there was an error invoking the method.
    @[JSON::Field(emit_null: true)]
    property result : T?

    # The error object in case a request fails.
    property error : ResponseError?

    def initialize(@id, @result, @error = nil)
    end
  end

  struct ResponseError
    include JSON::Serializable

    # A number indicating the error type that occurred.
    property code : ErrorCode

    # A string providing a short description of the error.
    property message : String

    # A primitive or structured value that contains additional
    # information about the error. Can be omitted.
    property data : JSON::Any?
  end

  enum ErrorCode
    # Defined by JSON RPC
    ParseError     = -32700
    InvalidRequest = -32600
    MethodNotFound = -32601
    InvalidParams  = -32602
    InternalError  = -32603

    # Error code indicating that a server received a notification or
    # request before the server has received the `initialize` request.
    ServerNotInitialized = -32002
    UnknownErrorCode     = -32001

    # A request failed but it was syntactically correct, e.g the
    # method name was known and the parameters were valid. The error
    # message should contain human readable information about why
    # the request failed.
    RequestFailed = -32803

    # The server cancelled the request. This error code should only
    # be used for requests that explicitly support being server cancellable.
    ServerCancelled = -32802

    # The server detected that the content of a document got
    # modified outside normal conditions. A server should
    # NOT send this error code if it detects a content change
    # in it unprocessed messages. The result even computed
    # on an older state might still be useful for the client.
    #
    # If a client decides that a result is not of any use anymore
    # the client should cancel the request.
    ContentModified = -32801

    # The client has canceled a request and a server as detected the cancel.
    RequestCancelled = -32800
  end
end
