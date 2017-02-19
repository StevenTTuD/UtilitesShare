class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.integer :charge_type,null: false, default: 0
      t.integer :price, null: false, default: 0
      t.integer :payer, null: false, default: 0
      t.integer :payee, null: false, default: 0
      t.date :paid_at
      t.string :note
      t.timestamps
    end
  end
end
