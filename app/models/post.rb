class Post < ApplicationRecord
    has_one_attached :image
    has_many :comment, dependent: :destroy
end
