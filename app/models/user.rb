class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments
  after_save :most_recent_post
  validates :name, presence: true, length: { in: 3..25 }
  validates :post_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :bio, presence: true
  validates :photo, presence: true

  def most_recent_post
    posts.order(created_at: :desc).includes(:user).limit(3)
  end
end
