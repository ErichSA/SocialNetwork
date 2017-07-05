class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  
  # the like associations
  has_many :likes
  has_many :liking_users, :through => :likes, :source => :user
end
