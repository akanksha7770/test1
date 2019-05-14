class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :math
      t.string :science
      t.string :english

      t.timestamps
    end
  end
end
