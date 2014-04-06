require 'spec_helper'

describe 'silent_fail_check' do
  context 'validation' do
    it 'fail : add new log' do
      SilentFailCheck::Logger.should_receive(:add)
                             .with("User : connection_time [\"is not a number\"]")
      User.create(name: 'borris', connection_time: 'az')
    end
  end
end
