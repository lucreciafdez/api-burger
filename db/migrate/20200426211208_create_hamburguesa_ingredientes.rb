class CreateHamburguesaIngredientes < ActiveRecord::Migration[6.0]
  def change
      create_join_table :hamburguesas, :ingredientes do |t|
         t.index [:hamburguesa_id, :ingrediente_id],{name: "index_hambur_ingred"}
         t.index [:ingrediente_id, :hamburguesa_id], {name: "index_ingred_hambur"}
      end
  end
end
