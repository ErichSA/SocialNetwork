class Like < ApplicationRecord
  #belongs_to :post, polymorphic: true
  #belongs_to :user
  belongs_to :likeable, polymorphic: true
end
