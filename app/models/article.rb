class Article < ApplicationRecord
	has_many :comments
	has_many :likes
	validates :title, presence: true,
					  length: { minimum: 5 }
	belongs_to :user
	belongs_to :category

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
