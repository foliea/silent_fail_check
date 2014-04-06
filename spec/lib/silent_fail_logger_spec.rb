require 'spec_helper'

describe 'silent_fail_logger' do
  context 'logger :' do
    it 'add new log' do
      SilentFailCheck::Logger.add("Test")
      SilentFailLog.count.should be > 0
    end
  end
end
