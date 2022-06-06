require "json"

module LSP
  struct TextDocumentSyncClientCapabilities
    include JSON::Serializable

    # Whether text document synchronization supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?

    # The client supports sending will save notifications.
    @[JSON::Field(key: "willSave")]
    property will_save : Bool?

    # The client supports sending a will save request and
    # waits for a response providing text edits which will
    # be applied to the document before it is saved.
    @[JSON::Field(key: "willSaveWaitUntil")]
    property will_save_wait_until : Bool?

    # The client supports did save notifications.
    @[JSON::Field(key: "didSave")]
    property did_save : Bool?
  end
end
