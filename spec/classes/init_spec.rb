require 'spec_helper'
describe 'prtg' do

  context 'with defaults for all parameters' do
    it { should contain_class('prtg') }
  end
end
