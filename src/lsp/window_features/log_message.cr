require "json"
require "../message"

module LSP
  struct LogMessageParams
    include JSON::Serializable

    @[JSON::Field(converter: Enum::ValueConverter(LSP::MessageType))]
    property type : MessageType
    property message : String
  end
end
