require "json"
require "./progress"

module LSP
  module PartialResultParams
    # An optional token that a server can use to report partial results (e.g. streaming) to the client.
    @[JSON::Field(key: "partialResultToken")]
    property partial_result_token : ProgressToken?
end
