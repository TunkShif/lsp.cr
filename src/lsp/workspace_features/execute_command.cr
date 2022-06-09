require "json"

module LSP
  struct ExecuteCommandParams
    include JSON::Serializable
    include WorkDoneProgressParams

    # The identifier of the actual command handler.
    property command : String
    # Arguments that the command should be invoked with.
    property arguments : Array(JSON::Any)?
  end
end
