class Types::BlogType < Types::BaseObject
  field :id,         ID,     null: false, description: 'ブログID'
  field :userId,     ID,     null: true,  description: 'ブログを持つユーザーのID'
  field :name,       String, null: false, description: 'ブログ名称'
  field :text,       String, null: false, description: 'ブログのテキスト内容'
  field :created_at, String, null: true,  description: 'ブログの作成日時'
  field :updated_at, String, null: true,  description: 'ブログの更新日時'
end
  