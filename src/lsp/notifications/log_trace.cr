require "json"
require "../trace_value"

module LSP
  struct LogTraceParams
    include JSON::Serializable

    # The message to be logged.
    property message : String

    # Additional information that can be computed if the `trace` configuration
    # is set to `'verbose'`
    property verbose : String
  end
end
