class User < ApplicationRecord
  has_secure_password
  has_many :subscriptions
  has_many :bookmarks
  has_many :categories, through: :bookmarks
  has_many :follows
  has_many :users, through: :follows
  has_many :comments
  has_many :comment_bookmarks, through: :comments, source: :bookmarks
  validates_presence_of :username, :password
  validates_uniqueness_of :username
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
end
