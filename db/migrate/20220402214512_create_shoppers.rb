class CreateShoppers < ActiveRecord::Migration[6.1]
  def change
    create_table :shoppers do |t|
      t.integer :id_csv
      t.string :name
      t.string :email
      t.string :nif

      t.timestamps
    end
  end
end
