require "json"
require "../message"

module LSP
  struct ShowMessageParams
    include JSON::Serializable

    @[JSON::Field(converter: Enum::ValueConverter(MessageType))]
    property type : MessageType
    property message : String
  end

  struct ShowMessageRequestParams
    include JSON::Serializable

    @[JSON::Field(converter: Enum::ValueConverter(MessageType))]
    property type : MessageType

    # The actual message
    property message : String

    # The message action items to present.
    property actions : Array(MessageActionItem)?
  end

  struct MessageActionItem
    include JSON::Serializable

    # A short title like 'Retry', 'Open Log' etc.
    property title : String
  end
end
