class Article < ActiveRecord::Base  #now rails gives us getters and setters for d table
  belongs_to :user
  has_many :article_categories

has_many :categories, through: :article_categories
  validates :title, presence: true, length: { minimum: 3, maximum: 50 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 } #des shld be present of min length 10 and max length 300
  validates :user_id, presence: true
end