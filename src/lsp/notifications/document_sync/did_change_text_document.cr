require "json"
require "../../text_document"
require "../../text_document_sync"

module LSP
  # Describe options to be used when registering for text document change events.
  struct TextDocumentChangeRegistrationOptions
    include JSON::Serializable
    include TextDocumentRegistrationOptions

    # How documents are synced to the server. See TextDocumentSyncKind.Full
    # and TextDocumentSyncKind.Incremental.
    @[JSON::Field(key: "syncKind")]
    property sync_kind : TextDocumentSyncKind
  end

  struct DidChangeTextDocumentParams
    include JSON::Serializable

    # The document that did change. The version number points
    # to the version after all provided content changes have
    # been applied.
    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    # The actual content changes. The content changes describe single state
    # changes to the document. So if there are two content changes c1 (at
    # array index 0) and c2 (at array index 1) for a document in state S then
    # c1 moves the document from S to S' and c2 from S' to S''. So c1 is
    # computed on the state S and c2 is computed on the state S'.
    #
    # To mirror the content of a document using change events use the following
    # approach:
    # - start with the same initial content
    # - apply the 'textDocument/didChange' notifications in the order you
    #   receive them.
    # - apply the `TextDocumentContentChangeEvent`s in a single notification
    #   in the order you receive them.
    @[JSON::Field(key: "contentChanges")]
    property content_changes : Array(TextDocumentContentChangeEvent)
  end

  # An event describing a change to a text document. If only a text is provided
  # it is considered to be the full content of the document.
  struct TextDocumentContentChangeEvent
    include JSON::Serializable

    # The new text of the whole document.
    property text : String

    # The range of the document that changed.
    property range : Range?

    # The optional length of the range that got replaced.
    #
    # @deprecated use range instead.
    @[JSON::Field(key: "rangeLength")]
    property range_length : UInt32?
  end
end
