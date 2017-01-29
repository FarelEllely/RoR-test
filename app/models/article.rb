class Article < ApplicationRecord
	is_impressionable :counter_cache => true, :column_name => :views, :unique => :request_hash
	extend FriendlyId
	friendly_id :title, use: :slugged
	has_many :comments
	has_many :likes
	validates :title, presence: true,
					  length: { minimum: 5 }
	belongs_to :user
	belongs_to :category

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/


	def self.all_except(article)
		where.not(id: article)
	end

	def should_generate_new_friendly_id?
	end
end
