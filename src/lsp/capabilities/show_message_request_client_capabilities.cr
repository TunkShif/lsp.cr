require "json"

module LSP
  # Show message request client capabilities
  struct ShowMessageRequestClientCapabilities
    include JSON::Serializable

    @[JSON::Field(key: "messageActionItem")]
    property message_action_item : MessageActionItem?

    struct MessageActionItem
      include JSON::Serializable

      # Whether the client supports additional attributes which
      # are preserved and sent back to the server in the
      # request's response.
      @[JSON::Field(key: "additionalPropertiesSupport")]
      property additional_properties_support : Bool?
    end
  end
end
