class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'posts_id'
  has_many :comments, class_name: 'Comment', foreign_key: 'posts_id'
  after_save :update_posts_counter
  validates :title, presence: true
  validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

  def update_posts_counter
    author.increment!(:post_counter)
  end

  def most_recent_comment
    comments.where(posts_id: id).order(created_at: :desc).limit(5)
  end
end
