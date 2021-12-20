class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :subscriptions
      t.float :amount, default: 0.0
      t.string :aasm_string, default: 'initiated'
      t.datetime :completed_at

      t.timestamps
    end
  end
end
