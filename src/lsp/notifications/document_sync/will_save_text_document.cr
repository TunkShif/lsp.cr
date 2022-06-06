require "json"
require "../../text_document"

module LSP
  # The parameters send in a will save text document notification.
  struct WillSaveTextDocumentParams
    include JSON::Serializable

    # The document that will be saved.
    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    @[JSON::Field(converter: Enum::ValueConverter(TextDocumentSaveReason))]
    property reason : TextDocumentSaveReason
  end

  # Represents reasons why a text document is saved.
  enum TextDocumentSaveReason
    # Manually triggered, e.g. by the user pressing save, by starting
    # debugging, or by an API call.
    Manual = 1

    # Automatic after a delay.
    AfterDelay = 2

    # When the editor lost focus.
    FocusOut = 3
  end
end
