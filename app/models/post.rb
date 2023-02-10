class Post < ApplicationRecord
    belongs_to :author, class_name: 'User'
    has_many :likes
    has_many :comments

    after_save :update_posts_counter

    private
    def update_posts_counter
        user.increment!(:posts_counter)
    end

    def most_recent_comment
      comments.where(posts_id: id).order(created_at: :desc).limit(5)
    end
end
