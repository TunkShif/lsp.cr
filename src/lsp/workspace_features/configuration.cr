require "json"

module LSP
  struct ConfigurationParams
    include JSON::Serializable

    property items : Array(ConfigurationItem)
  end

  struct ConfigurationItem
    include JSON::Serializable

    # The scope to get the configuration section for.
    @[JSON::Field(key: "scopeUri")]
    property scope_uri : String?
    # The configuration section asked for.
    property section : String?
  end
end
