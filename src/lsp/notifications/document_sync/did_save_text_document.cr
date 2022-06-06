require "json"
require "../../text_document"
require "../../text_document_sync"

module LSP
  struct TextDocumentSaveRegistrationOptions
    include JSON::Serializable
    include TextDocumentRegistrationOptions

    # The client is supposed to include the content on save.
    @[JSON::Field(key: "includeText")]
    property include_text : Bool?
  end

  struct DidSaveTextDocumentParams
    include JSON::Serializable

    # The document that will be saved.
    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    # Optional the content when saved. Depends on the includeText value
    # when the save notification was requested.
    property text : String?
  end
end
