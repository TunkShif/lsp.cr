require "json"
require "../progress"

module LSP
  struct WorkDoneProgressCreateParams
    include JSON::Serializable

    # The token to be used to report progress.
    property token : ProgressToken
  end

  struct WorkDoneProgressCancelParams
    include JSON::Serializable

    # The token to be used to report progress.
    property token : ProgressToken
  end
end
