class HamburguesaSerializer < ActiveModel::Serializer
  attributes :id, :nombre, :precio, :descripcion, :imagen, :ingredientes
end
