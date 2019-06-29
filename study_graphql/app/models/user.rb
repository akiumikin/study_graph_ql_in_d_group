class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :user_tag_relations
  has_many :tags, through: :user_tag_relations

  # update!をした後の戻り値にactive_recordの形を取らせる
  def update_with_return_value(update_hash = {})
    return if update_hash.blank?

    self.update!(update_hash) # これでreturnするとtrue/falseが返る
    self
  end

  def model_method
    'called model_method'
  end
end
