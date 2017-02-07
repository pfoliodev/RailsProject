class Post < ApplicationRecord

	include Sluggable
	belongs_to :category, optional:true
	validates :title, presence: { message: 'ne doit pas etre vide'}
	validates :title, uniqueness: { message: 'existe deja dans la base de donnees'}

	has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
