class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :first_name
      t.string :last_name
      t.string :username, null: false
      t.string :stripe_id
      t.string :role, null: false, default: 'user'
      t.datetime :archived_at

      t.timestamps
    end
  end
end
