class Ingrediente < ApplicationRecord
  has_and_belongs_to_many :hamburguesas
  validates :nombre, presence: true
  validates :descripcion, presence: true

end
