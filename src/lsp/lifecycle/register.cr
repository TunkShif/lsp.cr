require "json"

module LSP
  struct RegistrationParams
    include JSON::Serializable

    property registerations : Array(Registration)
  end
end
