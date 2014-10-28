require 'spec_helper'

describe SilentFailCheck do
  context 'when a failure happened' do
    it 'uses the logger' do
      expect(SilentFailCheck::Logger).to receive(:add)
        .with("User : connection_time [\"is not a number\"]")
      User.create(name: 'borris', connection_time: 'az')
    end
  end
end
