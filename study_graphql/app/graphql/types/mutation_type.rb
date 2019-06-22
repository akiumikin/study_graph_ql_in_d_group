module Types
  class MutationType < Types::BaseObject
    field :upsert_user, mutation: Mutations::UpsertUser, null: false
    field :delete_user, mutation: Mutations::DeleteUser, null: false
  end
end
