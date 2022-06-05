require "json"
require "./text_edit"
require "./position"

module LSP
  struct TextDocumentIdentifier
    include JSON::Serializable

    property uri : String

    # The version number of this document. If an optional versioned text document
    # identifier is sent from the server to the client and the file is not
    # open in the editor (the server has not received an open notification
    # before) the server can send `null` to indicate that the version is
    # known and the content on disk is the master (as specified with document
    # content ownership).
    #
    # The version number of a document will increase after each change,
    # including undo/redo. The number doesn't need to be consecutive.
    property version : Int32?
  end

  struct TextDocumentItem
    include JSON::Serializable

    property uri : String

    # The text document's language identifier.
    @[JSON::Field(key: "languageId")]
    property langauge_id : String

    # The version number of this document (it will increase after each
    # change, including undo/redo).
    property version : String

    # The content of the opened text document.
    property text : String
  end

  struct TextDocumentPositionParams
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier
    property position : Position
  end

  struct TextDocumentEdit
    include JSON::Serializable

    # The text document to change.
    @[JSON::Field(key: "textDocument")]
    property text_document : TextDocumentIdentifier

    # The edits to be applied.
    property edits : Array(TextEdit | AnnotatedTextEdit)
  end
end
