class Post < ApplicationRecord

	include Sluggable
	belongs_to :category, optional:true
	validates :title, presence: { message: 'ne doit pas etre vide'}
	validates :title, uniqueness: { message: 'existe deja dans la base de donnees'}

end
