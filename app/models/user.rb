class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :posts
  has_many :comments
  
  # the like associations
  has_many :likes, as: :likeable
  
  #has_many :liked_posts, :through => :likes, :source => :post
  
  #has_many :liked_comments, :through => :likes, :source => :comments
  
  # User Avatar Validation
  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  private
    def avatar_size_validation
      errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
    end
  
end
