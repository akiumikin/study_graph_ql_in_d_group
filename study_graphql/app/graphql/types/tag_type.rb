class Types::TagType < Types::BaseObject
  field :id,         ID,                null: false, description: 'タグID'
  field :name,       String,            null: false, description: 'タグ名'
  field :created_at, String,            null: true,  description: 'タグの作成日時'
  field :updated_at, String,            null: true,  description: 'タグの更新日時'
end
  