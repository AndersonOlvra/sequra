class CreateMerchants < ActiveRecord::Migration[6.1]
  def change
    create_table :merchants do |t|
      t.integer :id_csv
      t.string :name
      t.string :email
      t.string :cif

      t.timestamps
    end
  end
end
