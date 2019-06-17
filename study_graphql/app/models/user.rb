class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :user_tag_relations
  has_many :tags, through: :user_tag_relations
end
