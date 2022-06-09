require "json"

module LSP
  struct DidChangeConfigurationParams
    include JSON::Serializable

    property settings : JSON::Any
  end
end
