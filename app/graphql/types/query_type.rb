Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :user, function: Resolvers::User.new
  field :users, function: Resolvers::Users.new
end
