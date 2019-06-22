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

  def blogs
    AssociationLoader.for(User, :blogs).load(object)
  end

  def tag(id:)
    AssociationLoader.for(User, :tags).load(object).then do |tags|
      tags.detect { |tag| tag.id == id.to_i }
    end
  end

  def tags
    AssociationLoader.for(User, :tags).load(object)
  end
end
  