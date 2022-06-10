require "../diagnostic"

module LSP
  struct PublishDiagnosticsParams
    include JSON::Serializable

    def initialize(@uri, @diagnostics, @version = nil)
    end

    # The URI for which diagnostic information is reported.
    property uri : String

    # Optional the version number of the document the diagnostics are published
    # for.
    property version : Int32?

    # An array of diagnostic information items.
    property diagnostics : Array(Diagnostic)
  end
end
