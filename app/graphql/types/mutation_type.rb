Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :addUser, function: Mutations::AddUser.new
  field :addArticle, function: Mutations::AddArticle.new
end
