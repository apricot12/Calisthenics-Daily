class Article < ApplicationRecord
  validates :title, :text, :image, :category, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :votes
  belongs_to :category
  has_one_attached :image, dependent: :destroy
end
