require "json"
require "./position"
require "./text_edit"

module LSP
  struct TextDocumentEdit
    include JSON::Serializable

    @[JSON::Field(key: "textDocument")]
    property text_document : String
    property edits : Array(TextEdit | AnnotatedTextEdit)
  end
end
