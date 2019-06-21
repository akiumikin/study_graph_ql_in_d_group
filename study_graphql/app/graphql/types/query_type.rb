module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: false, description: 'ユーザー' do
      argument :id, ID, required: true
    end
    field :users, [Types::UserType], null: false, description: 'ユーザー' do
      argument :ids, [ID], required: true
    end

    def user(id:)
      User.find_by(id: id)
    end

    def users(ids:)
      User.where(id: ids).limit(100)
    end
  end
end
