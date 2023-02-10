class User < ApplicationRecord
    has_many :posts
    has_many :likes
    has_many :comments
    after_save :most_recent_post

    def most_recent_post
      posts.order(created_at: :desc).includes(:user).limit(3)
    end
end
