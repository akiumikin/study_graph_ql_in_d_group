class Types::UserType < Types::BaseObject
  model User
  field_config({
    preload: %i[blogs tags tag],
    agent_forbidden: %i[id name tags blogs model_method]
  })

  # model column
  field :id,           ID,                null: false, description: 'ユーザーID'
  field :name,         String,            null: false, description: 'ユーザー名'
  field :created_at,   String,            null: true,  description: 'ユーザーの作成日時'
  field :updated_at,   String,            null: true,  description: 'ユーザーの更新日時'

  # relation
  field :blogs,        [Types::BlogType], null: true,  description: 'ユーザーに紐づくブログ'
  field :tag,          Types::TagType,    null: true,  description: 'ユーザーに紐づくタグ' do
    argument :id  , ID , required: true
  end
  field :tags,         [Types::TagType],  null: true,  description: 'ユーザーに紐づくタグ全部'

  # model methods
  field :model_method, String,            null: false, description: 'モデル側で定義されたメソッドのデバッグ用'
end
  