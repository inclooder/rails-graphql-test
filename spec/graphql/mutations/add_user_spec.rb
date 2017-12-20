require 'rails_helper'

describe Mutations::AddUser do
  let(:resolver) { described_class.new }
  let(:args) { { name: 'John'} }

  describe '#call' do
    it 'creates new user in the database' do
      expect {
        resolver.call(nil, args, {})
      }.to change { User.count }.from(0).to(1)
    end

    it 'assigns name' do
      resolver.call(nil, args, {})
      expect(User.first.name).to eq('John')
    end
  end
end
