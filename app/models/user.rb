class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true
  has_many :posts
  has_many :comments
end
