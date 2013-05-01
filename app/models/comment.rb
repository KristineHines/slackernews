class Comment < ActiveRecord::Base
  # Remember to create a migration!
  validates :comment_body, :presence => true
  belongs_to :post
  belongs_to :user
end
