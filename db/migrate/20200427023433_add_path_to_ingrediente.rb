class AddPathToIngrediente < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredientes, :path, :string
  end
end
