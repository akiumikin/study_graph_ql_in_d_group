class Mutations::UpsertUser < Mutations::BaseMutation
  description 'ユーザーの作成・更新を行う'
  
  # 作成用メソッドの引数
  argument :id,   ID,     required: false, description: 'ユーザーID、有：更新、無：作成'
  argument :name, String, required: true,  description: 'ユーザー名'
  
  # responseのfield
  field :user,          Types::UserType, null: true, description: 'ユーザー変更内容の戻り値'
  field :error_message, String,          null: true, description: 'エラー発生時のサーバからのメッセージ'
  
  def resolve(id: nil, name:)
    res_user = nil

    if id.present? # 更新処理
      res_user = User.find(id).update!(name: name)
    else           # 作成処理
      res_user = User.create!(name: name)
    end
    
    { user: res_user, error_message: nil }
  rescue => e
    { user: res_user, error_message: e.message }
  end
end