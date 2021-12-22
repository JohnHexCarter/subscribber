class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title
      t.string :slug
      t.integer :parent_id

      t.timestamps
    end

    add_index :categories, :parent_id
    add_foreign_key :categories, :categories, column: :parent_id
  end
end
