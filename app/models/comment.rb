class Comment < ActiveRecord::Base
   belongs_to :user
  validates :body, :user, presence: true
    belongs_to :post
end
