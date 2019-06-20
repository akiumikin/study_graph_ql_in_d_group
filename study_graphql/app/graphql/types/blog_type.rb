class Types::BlogType < Types::BaseObject
  field :id,         ID,     null: false, description: 'ブログID'
  field :name,       String, null: false, description: 'ブログ名称'
  field :text,       String, null: false, description: 'ブログのテキスト内容'
  field :created_at, String, null: true,  description: 'ブログの作成日時'
  field :updated_at, String, null: true,  description: 'ブログの更新日時'
end
  