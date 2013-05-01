class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, :presence => true, :uniqueness => true
  validates :username, :presence => true, :uniqueness => true
  has_many :posts
  has_many :comments


  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
end
