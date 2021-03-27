class Tag < ApplicationRecord
    has_many :comment_tags, dependent: :destroy
    has_many :comments, through: :comment_tags
end