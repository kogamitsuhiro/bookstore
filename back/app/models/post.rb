class Post < ApplicationRecord
  belongs_to :user
  has_many :posts_category
  has_many :categories, through: :posts_category

  validates :body, presence: true
  validates :title, presence: true
end
