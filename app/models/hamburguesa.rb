class Hamburguesa < ApplicationRecord
  serialize :ingredientes, Array
  has_and_belongs_to_many :ingredientes
  validates :nombre, presence: true
  validates :precio, presence: true
  validates :descripcion, presence: true
  validates :imagen, presence: true
end
