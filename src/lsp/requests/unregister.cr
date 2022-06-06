require "json"

module LSP
  # General parameters to unregister a capability.
  struct Unregistration
    include JSON::Serializable

    # The id used to unregister the request or notification. Usually an id
    # provided during the register request.
    property id : String

    # The method / capability to unregister for.
    property method : String
  end

  struct UnregistrationParams
    include JSON::Serializable

    # This should correctly be named `unregistrations`. However changing this
    # is a breaking change and needs to wait until we deliver a 4.x version
    # of the specification.
    property unregisterations : Array(Unregistration)
  end
end
