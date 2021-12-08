class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :description, null: false
      t.datetime :archived_at

      t.timestamps
    end

    create_table :page_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :page, null: false, foreign_key: true
      t.string :role, default: 'manager'

      t.timestamps
    end
  end
end
