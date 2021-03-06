require "json"
require "../work_done_progress"
require "../partial_result_params"

module LSP
  # The parameters of a Workspace Symbol Request.
  struct WorkspaceSymbolParams
    include JSON::Serializable
    include WorkDoneProgressParams
    include PartialResultParams

    # A query string to filter symbols by. Clients may send an empty
    # string here to request all symbols.
    property query : String
  end
end
