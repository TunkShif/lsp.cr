require "json"

module LSP
  # The parameters sent in notifications/requests for user-initiated creation
  # of files.
  struct CreateFilesParams
    include JSON::Serializable

    # An array of all files/folders created in this operation.
    property files : Array(FileCreate)
  end

  # Represents information on a file/folder create.
  struct FileCreate
    include JSON::Serializable

    # A file:// URI for the location of the file/folder being created.
    property uri : String
  end
end
