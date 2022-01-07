class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :users
      t.references :posts
      t.string :content, null: false

      t.timestamps
    end
  end
end
