class SilentFailLogger
  def self.add message
    SilentFailLog.create(message: message)
  end
end
