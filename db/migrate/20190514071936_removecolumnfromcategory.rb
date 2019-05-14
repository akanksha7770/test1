class Removecolumnfromcategory < ActiveRecord::Migration[5.2]
  def change
  	remove_column :categories, :math, :string
  	remove_column :categories, :science, :string
  	remove_column :categories, :english, :string
  	add_column :categories, :name, :string
  end
end
