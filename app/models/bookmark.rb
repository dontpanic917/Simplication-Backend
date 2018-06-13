class Bookmark < ApplicationRecord
  belongs_to :user
  has_many :bookmark_categories
  has_many :categories, through: :bookmark_categories
  has_many :comments
  has_many :comment_users, through: :comments, source: :users
end
