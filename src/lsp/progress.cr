require "json"

module LSP
  alias ProgressToken = Int32 | String

  struct ProgressParams(T)
    include JSON::Serializable

    # The progress token provided by the client or server.
    property token : ProgressToken

    # The progress data.
    property value : T
  end
end
