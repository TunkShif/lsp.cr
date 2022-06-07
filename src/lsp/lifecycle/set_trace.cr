require "json"
require "../trace_value"

module LSP
  struct SetTraceParams
    include JSON::Serializable

    # The new value that should be assigned to the trace setting.
    property value : TraceValue
  end
end
