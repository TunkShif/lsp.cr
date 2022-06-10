require "json"
require "./location"

module LSP
  struct Diagnostic
    include JSON::Serializable

    def initialize(
      @range,
      @message,
      @source = nil,
      @severity = nil,
      @code = nil,
      @code_description = nil,
      @tags = nil,
      @related_information = nil,
      @data = nil
    )
    end

    # The range at which the message applies.
    property range : Range

    # The diagnostic's severity. Can be omitted. If omitted it is up to the
    # client to interpret diagnostics as error, warning, info or hint.
    @[JSON::Field(converter: Enum::ValueConverter(LSP::DiagnosticSeverity))]
    property severity : DiagnosticSeverity?

    # The diagnostic's code, which might appear in the user interface.
    property code : (Int32 | String)?

    # An optional property to describe the error code
    @[JSON::Field(key: "codeDescription")]
    property code_description : CodeDescription?

    # A human-readable string describing the source of this
    # diagnostic, e.g. 'typescript' or 'super lint'.
    property source : String?

    # The diagnostic's message.
    property message : String

    # Additional metadata about the diagnostic.
    property tags : Array(DiagnosticTag)?

    # An array of related diagnostic information, e.g. when symbol-names within
    # a scope collide all definitions can be marked via this property.
    @[JSON::Field(key: "relatedInformation")]
    property related_information : Array(DiagnosticRelatedInformation)?

    # A data entry field that is preserved between a
    # `textDocument/publishDiagnostics` notification and
    # `textDocument/codeAction` request.
    property data : JSON::Any?
  end

  enum DiagnosticSeverity
    Error       = 1
    Warning     = 2
    Information = 3
    Hint        = 4
  end

  enum DiagnosticTag
    # Unused or unnecessary code.
    #
    # Clients are allowed to render diagnostics with this tag faded out
    # instead of having an error squiggle.
    Unnecessary = 1
    # Deprecated or obsolete code.
    #
    # Clients are allowed to rendered diagnostics with this tag strike through.
    Deprecated = 2
  end

  # Structure to capture a description for an error code.
  struct CodeDescription
    include JSON::Serializable

    # An URI to open with more information about the diagnostic error.
    property href : String
  end

  # Represents a related message and source code location for a diagnostic.
  # This should be used to point to code locations that cause or are related to
  # a diagnostics, e.g when duplicating a symbol in a scope.
  struct DiagnosticRelatedInformation
    include JSON::Serializable

    property location : Location
    property message : String
  end
end
