require "json"
require "../workspace_folder"

module LSP
  struct DidChangeWorkspaceFoldersParams
    include JSON::Serializable

    # The actual workspace folder change event.
    property event : WorkspaceFolderChangeEvent
  end

  struct WorkspaceFolderChangeEvent
    include JSON::Serializable

    # The array of added workspace folders
    property added : Array(WorkspaceFolder)

    # The array of the removed workspace folders
    property removed : Array(WorkspaceFolder)
  end
end
