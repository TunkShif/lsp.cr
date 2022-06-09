require "json"
require "./message"

module LSP
  abstract class RequestMessage(T)
    include Message
    include JSON::Serializable

    property id : Int32 | String
    property method : String
    property params : T?
  end
end
