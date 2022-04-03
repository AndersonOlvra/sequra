class CreateImports < ActiveRecord::Migration[6.1]
  def change
    create_table :imports do |t|
      t.string :status
      t.string :import_type

      t.timestamps
    end
  end
end
