require "json"
require "../document_filter"

module LSP
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

  struct RegistrationParams
    include JSON::Serializable

    property registerations : Array(Registration)
  end

  # Static registration options to be returned in the initialize request.
  struct StaticRegistrationOptions
    include JSON::Serializable

    # The id used to register the request. The id can be used to deregister
    # the request again. See also Registration#id.
    property id : String?
  end
end
