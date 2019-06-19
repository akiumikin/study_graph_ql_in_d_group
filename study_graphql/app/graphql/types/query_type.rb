module Types
  class QueryType < Types::BaseObject
    field :user, Types::UserType, null: false, description: 'ユーザー' do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find_by(id: id)
    end
  end
end
