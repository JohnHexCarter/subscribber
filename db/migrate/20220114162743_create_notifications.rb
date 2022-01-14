class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :users
      t.datetime :viewed_at
      t.string :url
      t.string :content

      t.timestamps
    end
  end
end
