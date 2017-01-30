class Category < ApplicationRecord

  include Sluggable

  has_many :posts
  validates :title, presence: { message: 'ne doit pas etre vide'}
  validates :title, uniqueness: { message: 'existe deja dans la base de donnees'}

end
