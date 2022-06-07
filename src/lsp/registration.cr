require "json"

module LSP
  # Static registration options to be returned in the initialize request.
  module StaticRegistrationOptions
    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    property id : String?
  end

  # General parameters to register for a capability.
  struct Registration
    include JSON::Serializable

    # The id used to register the request. The id can be used to deregister
    # the request again.
    property id : String

    # The method / capability to register for.
    property method : String

    # Options necessary for the registration.
    @[JSON::Field(key: "registerOptions")]
    property register_options : JSON::Any?
  end

  # General parameters to unregister a capability.
  struct Unregistration
    include JSON::Serializable

    # The id used to unregister the request or notification. Usually an id
    # provided during the register request.
    property id : String

    # The method / capability to unregister for.
    property method : String
  end
end
