class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :presence => true
  validates :post_body, :presence => true
  has_many :comments
  belongs_to :user
end
