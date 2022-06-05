require "json"

module LSP
  struct RegularExpressionsClientCapabilities
    include JSON::Serializable

    property engine : String
    property version : String?
  end
end
