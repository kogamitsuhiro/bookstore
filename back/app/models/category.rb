class Category < ApplicationRecord
  has_many :posts_category
  has_many :posts, through: :posts_category

  validates :name, presence: true
end
