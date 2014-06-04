require 'spec_helper'

describe SilentFailCheck::Logger do

  context 'when logger is used' do

    it 'adds new log' do
      SilentFailCheck::Logger.add('Test')
      expect(SilentFailLog.count).to be > 0
    end
  end
end
