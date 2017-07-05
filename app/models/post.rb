class Post < ApplicationRecord
  #belongs_to :user
  mount_uploader :image, AvatarUploader
  belongs_to :user
  has_many :comments
  default_scope -> { order(created_at: :desc) }
  
  # the like associations
  has_many :likes, as: :likeable
  
  #has_many :liking_users, :through => :likes, :source => :user
  
end
