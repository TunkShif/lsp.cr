require "json"

module LSP
  struct CancelParams
    include JSON::Serializable

    # The request id to cancel.
    property id : Int32 | String
  end
end
