require "json"
require "./message"

module LSP
  abstract class NotificationMessage(T)
    include Message
    include JSON::Serializable

    # def intialize(@method, @params = nil)
    # end

    property method : String
    property params : T
  end
end
