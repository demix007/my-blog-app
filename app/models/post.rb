class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :likes
    has_many :comments
    after_save :update_posts_counter
    validates :title, presence: true
    validates :comments_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }
    validates :likes_counter, numericality: { only_integer: true }, comparison: { greater_than_or_equal_to: 0 }

    private
    def update_posts_counter
        user.increment!(:posts_counter)
    end

    def most_recent_comment
      comments.where(posts_id: id).order(created_at: :desc).limit(5)
    end
end
