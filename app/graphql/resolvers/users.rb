class Resolvers::Users < GraphQL::Function
  argument :limit, types.Int, default_value: 30
  type !types[Types::UserType]

  def call(obj, args, ctx)
    ::User.limit(args[:limit])
  end
end
