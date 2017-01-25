class Post < ApplicationRecord

	include Sluggable
	
	validates :title, presence: { message: 'ne doit pas etre vide'}
	validates :title, uniqueness: { message: 'existe deja dans la base de donnees'}
	before_validation :default_slug
end
