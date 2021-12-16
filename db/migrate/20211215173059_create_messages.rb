class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :content, null: false
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.datetime :seen_at

      t.timestamps
    end

    add_index :messages, :sender_id
    add_foreign_key :messages, :users, column: :sender_id

    add_index :messages, :recipient_id
    add_foreign_key :messages, :users, column: :recipient_id
  end
end
