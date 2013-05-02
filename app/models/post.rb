class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  validates :post_body, :presence => true, :if => "url.blank?" 
  validates :url, :presence => true, :if => "post_body.blank?", :format => {:with => /(^$)|([a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/}
  validates :title, :presence => true


end
