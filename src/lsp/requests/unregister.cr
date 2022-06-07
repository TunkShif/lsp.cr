require "json"
require "../registration"

module LSP
  struct UnregistrationParams
    include JSON::Serializable

    # This should correctly be named `unregistrations`. However changing this
    # is a breaking change and needs to wait until we deliver a 4.x version
    # of the specification.
    property unregisterations : Array(Unregistration)
  end
end
