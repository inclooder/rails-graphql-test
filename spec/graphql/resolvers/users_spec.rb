require 'rails_helper'

describe Resolvers::Users do
  let(:resolver) { described_class.new }
  let(:users) do
    (0..10).map do |index|
      User.create!(name: "name_#{index}")
    end
  end
  let(:args) { {} }

  describe '#call' do
    it 'returns list of users' do
      result = resolver.call(nil, args, {})
      expect(result).to eq(users)
    end
  end
end
