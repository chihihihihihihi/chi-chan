class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :comment_tags, dependent: :destroy
  has_many :tags, through: :comment_tags
end
