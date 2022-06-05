require "json"
require "./message"

  module LSP
    struct NotificationMessage
      include Message
      include JSON::Serializable

      property method : String
      property params : JSON::Any?
    end
  end
