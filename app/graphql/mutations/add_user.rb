class Mutations::AddUser < GraphQL::Function
  argument :name, !types.String
  type Types::UserType

  def call(obj, args, ctx)
    User.create!(name: args[:name])
  rescue ActiveRecord::RecordInvalid => e
    GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end
