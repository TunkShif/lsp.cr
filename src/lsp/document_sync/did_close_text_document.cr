require "json"
require "../text_document"
require "../text_document_sync"

module LSP
  struct DidCloseTextDocumentParams
    include JSON::Serializable

    # The document that was closed
    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
  end
end
