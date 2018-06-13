class Category < ApplicationRecord
  has_many :bookmark_categories
  has_many :bookmarks, through: :categories
end
