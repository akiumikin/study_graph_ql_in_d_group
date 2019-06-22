class Mutations::DeleteUser < Mutations::BaseMutation
  description 'ユーザーの削除を行う'
  
  # 作成用メソッドの引数
  argument :id, ID, required: true, description: 'ユーザーID'
  
  # responseのfield
  field :user,          Types::UserType, null: true, description: 'ユーザー変更内容の戻り値'
  field :error_message, String,          null: true, description: 'エラー発生時のサーバからのメッセージ'
  
  def resolve(id: nil)
    res_user = User.find(id).delete
    
    { user: res_user, error_message: nil }
  rescue => e
    { user: res_user, error_message: e.message }
  end
end