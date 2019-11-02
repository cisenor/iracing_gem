# frozen_string_literal: true

require 'iracing_gem'

RSpec.describe IRacing::API do
  describe 'Singleton' do
    it 'creates an instance' do
      expect(IRacing::API.instance).to be_a IRacing::API
    end
  end
end
