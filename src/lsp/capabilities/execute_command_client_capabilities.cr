require "json"
require "../work_done_progress"

module LSP
  struct ExecuteCommandClientCapabilities
    include JSON::Serializable

    # Execute command supports dynamic registration.
    @[JSON::Field(key: "dynamicRegistration")]
    property dynamic_registration : Bool?
  end

  struct ExecuteCommandOptions
    include JSON::Serializable
    include WorkDoneProgressOptions

    # The commands to be executed on the server
    property commands : Array(String)
  end

  alias ExecuteCommandRegistrationOptions = ExecuteCommandOptions
end
