class Comment < ApplicationRecord
  belongs_to :post
  has_one_attached :video
  belongs_to :user
end
