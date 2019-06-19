class Types::UserType < Types::BaseObject
  field :id,         ID,     null: false, description: 'ユーザーID'
  field :name,       String, null: false, description: 'ユーザー名'
  field :created_at, String, null: true,  description: 'ユーザーの作成日時'
  field :updated_at, String, null: true,  description: 'ユーザーの更新日時'
end
  