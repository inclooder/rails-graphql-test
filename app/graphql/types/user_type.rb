Types::UserType = GraphQL::ObjectType.define do
  name "User"
  field :id, types.Int
  field :name, types.String
  field :articles, !types[Types::ArticleType] do
    resolve ->(obj, args, ctx) {
      obj.articles
    }
  end
end
