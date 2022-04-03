class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :id_csv
      t.references :merchant, null: false, foreign_key: true
      t.references :shopper, null: false, foreign_key: true
      t.float :amount
      t.datetime :created
      t.datetime :completed
      t.string :status
      t.float :disburse

      t.timestamps
    end
  end
end
