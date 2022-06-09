require "json"

module LSP
  # Client capabilities for the show document request.
  struct ShowDocumentClientCapabilities
    include JSON::Serializable

    # The client has support for the show document
    # request.
    property support : Bool
  end
end
