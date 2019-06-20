class Types::UserType < Types::BaseObject
  field :id,         ID,                null: false, description: 'ユーザーID'
  field :name,       String,            null: false, description: 'ユーザー名'
  field :created_at, String,            null: true,  description: 'ユーザーの作成日時'
  field :updated_at, String,            null: true,  description: 'ユーザーの更新日時'

  field :blogs,      [Types::BlogType], null: true,  description: 'ユーザーに紐づくブログ'
  field :tag,        Types::TagType,    null: true,  description: 'ユーザーに紐づくタグ' do
    argument :id  , ID , required: true
  end
  field :tags,       [Types::TagType],  null: true,  description: 'ユーザーに紐づくタグ全部'

  def tag(id:)
    object.tags.find(id)
  end

  def tags
    object.tags
  end
end
  