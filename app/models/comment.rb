class Comment < ApplicationRecord
  belongs_to :student
  has_one_attached :image
end
