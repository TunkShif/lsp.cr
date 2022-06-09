require "json"

module LSP
  # The parameters sent in notifications/requests for user-initiated deletes
  # of files.
  struct DeleteFilesParams
    include JSON::Serializable

    # An array of all files/folders deleted in this operation.
    property files : Array(FileDelete)
  end

  # Represents information on a file/folder delete.
  struct FileDelete
    include JSON::Serializable

    # A file:// URI for the location of the file/folder being deleted.
    property uri : String
  end
end
