class Student < ApplicationRecord
    has_many :comments , dependent: :destroy
    has_one_attached :image

    validates :name, presence: true
     validates :email, presence: true, uniqueness: true
     validates :password, length: { minimum: 6 }

    
end
