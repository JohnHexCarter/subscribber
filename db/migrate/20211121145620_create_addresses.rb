class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_1, null: false
      t.string :address_2
      t.string :city, null: false
      t.string :province, null: false
      t.string :postal_code, null: false
      t.string :country, null: false, default: 'USA'
      t.datetime :archived_at

      t.timestamps
    end

    create_table :address_users do |t|
      t.references :address
      t.references :user
      t.string :address_type

      t.timestamps
    end
  end
end
