require "json"
require "./message"

module LSP
  struct RequestMessage
    include Message
    include JSON::Serializable

    property id : Int32 | String
    property method : String
    property params : JSON::Any?
  end
end
