class Comment < ActiveRecord::Base
   belongs_to :user
  validates :body, :user, presence: true
   validates_presence_of :post, :body
    belongs_to :post
end
