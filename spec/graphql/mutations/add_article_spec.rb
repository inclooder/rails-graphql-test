require 'rails_helper'

describe Mutations::AddArticle do
  let(:resolver) { described_class.new }
  let!(:user) { User.create!(name: 'Alice') }
  let(:args) { 
    {
      title: 'Lovely article',
      body: 'Some random crap',
      userId: user.id
    }
  }

  describe '#call' do
    it 'creates new article in the database' do
      expect {
        resolver.call(nil, args, {})
      }.to change { Article.count }.from(0).to(1)
    end

    it 'assigns title' do
      resolver.call(nil, args, {})
      expect(Article.first.title).to eq('Lovely article')
    end

    it 'assigns body' do
      resolver.call(nil, args, {})
      expect(Article.first.body).to eq('Some random crap')

    end

    context 'when user is not in the database' do
      it 'returns execution error' do
        args[:userId] = user.id + 1
        result = resolver.call(nil, args, {}) 
        expect(result).to be_a(GraphQL::ExecutionError)
        expect(result.message).to eq("Invalid input: Couldn't find User with 'id'=#{args[:userId]}")
      end
    end
  end
end
