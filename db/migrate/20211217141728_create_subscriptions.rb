class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :aasm_state, null: false, default: 'pending'
      t.float :amount, null: false, default: 0.00
      t.references :users
      t.references :pages

      t.timestamps
    end
  end
end
