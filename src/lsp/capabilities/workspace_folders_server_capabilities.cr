require "json"

module LSP
  struct WorkspaceFoldersServerCapabilities
    include JSON::Serializable

    def initialize(@supported = false, @change_notifications = false)
    end

    # The server has support for workspace folders
    property supported : Bool?

    # Whether the server wants to receive workspace folder
    # change notifications.
    #
    # If a string is provided, the string is treated as an ID
    # under which the notification is registered on the client
    # side. The ID can be used to unregister for these events
    # using the `client/unregisterCapability` request.
    @[JSON::Field(key: "changeNotifications")]
    property change_notifications : (String | Bool)?
  end
end
