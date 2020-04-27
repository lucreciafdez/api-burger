class Ingrediente < ApplicationRecord
  has_and_belongs_to_many :hamburguesas
  @ingrediente.path = "burger-api-taller.herokuapp.com/ingrediente/#{@ingrediente.id}"

end
