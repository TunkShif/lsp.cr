require "json"

module LSP
  struct DidChangeConfigurationClientCapabilities
    include JSON::Serializable

    # Did change configuration notification supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?
  end
end
