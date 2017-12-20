require 'rails_helper'

describe Resolvers::User do
  let(:resolver) { described_class.new }
  let!(:user) { User.create!(name: 'Bob') }
  let(:args) { { id: user.id } }

  describe '#call' do
    it 'returns user from the database' do
      expect(resolver.call(nil, args, {})).to eq(user)
    end
  end
end
