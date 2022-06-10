require "json"

module LSP
  # Defines how the host (editor) should sync document changes to the language server.
  enum TextDocumentSyncKind
    # Documents should not be synced at all.
    None

    # Documents are synced by always sending the full content
    # of the document.
    Full

    # Documents are synced by sending the full content on open.
    # After that only incremental updates to the document are
    # send.
    Incremental
  end

  struct SaveOptions
    include JSON::Serializable

    # The client is supposed to include the content on save.
    @[JSON::Field(key: "includeText")]
    property include_text : Bool?
  end

  struct TextDocumentSyncOptions
    include JSON::Serializable

    def initialize(
      @change = TextDocumentSyncKind::None,
      @open_close = false,
      @will_save = false,
      @will_save_wait_until = false,
      @save = nil
    )
    end

    # Open and close notifications are sent to the server. If omitted open
    # close notification should not be sent.
    @[JSON::Field(key: "openClose")]
    property open_close : Bool?

    # Change notifications are sent to the server. See
    # TextDocumentSyncKind.None, TextDocumentSyncKind.Full and
    # TextDocumentSyncKind.Incremental. If omitted it defaults to
    # TextDocumentSyncKind.None.
    @[JSON::Field(converter: Enum::ValueConverter(LSP::TextDocumentSyncKind))]
    property change : TextDocumentSyncKind?

    # If present will save notifications are sent to the server. If omitted
    # the notification should not be sent.
    @[JSON::Field(key: "willSave")]
    property will_save : Bool?

    # If present will save wait until requests are sent to the server. If
    # omitted the request should not be sent.
    @[JSON::Field(key: "willSaveWaitUntil")]
    property will_save_wait_until : Bool?

    # If present save notifications are sent to the server. If omitted the
    # notification should not be sent.
    property save : (SaveOptions | Bool)?
  end
end
