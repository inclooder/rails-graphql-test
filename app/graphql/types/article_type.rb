Types::ArticleType = GraphQL::ObjectType.define do
  name "Article"

  field :id, types.ID
  field :user, -> { Types::UserType }
  field :title, types.String
  field :body, types.String
end
