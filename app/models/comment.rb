class Comment < ApplicationRecord

	belongs_to :book
	belongs_to :user

	 validates :comment, presence: true, length: { minimum:2, maximum: 200 }
end
