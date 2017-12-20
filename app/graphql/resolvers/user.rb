class Resolvers::User < GraphQL::Function
  argument :id, !types.ID
  type Types::UserType

  def call(obj, args, ctx)
    ::User.find(args[:id])
  end
end
