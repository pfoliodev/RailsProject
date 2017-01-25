class Post < ApplicationRecord
	validates :title, presence: { message: 'ne doit pas etre vide'}
	validates :title, uniqueness: { message: 'existe deja dans la base de donnees'}
end