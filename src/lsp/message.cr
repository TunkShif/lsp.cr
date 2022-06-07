module LSP
  module Message
    @jsonrpc = "2.0"
  end

  enum MessageType
    Error   = 1
    Warning = 2
    Info    = 3
    Log     = 4
  end
end
