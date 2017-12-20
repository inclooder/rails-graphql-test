class Mutations::AddArticle < GraphQL::Function
  argument :userId, !types.ID
  argument :title, !types.String
  argument :body, !types.String

  type Types::ArticleType
  
  def call(obj, args, ctx)
    Article.create!(
      user: User.find(args[:userId]),
      title: args[:title],
      body: args[:body]
    )
  rescue ActiveRecord::RecordNotFound => e
    GraphQL::ExecutionError.new("Invalid input: #{e.message}")
  end
end
