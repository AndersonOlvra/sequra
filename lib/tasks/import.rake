require 'roo'

namespace :import do
  desc "TODO"
  task data: :environment do
    puts 'Importing merchant...'
    
    # I choose to import the csvs in a background task because it can take some time depending of the number of lines
    Import.where(status: :active, import_type: :merchant).each do |merchant|
      # updating the status to finished to do not run the same again
      merchant.update(status: :finished)
      
      CSV.parse(merchant.file.download, headers: false) do |row|
        Merchant.create(
          id_csv: row.first,
          name: row.second,
          email: row.third,
          cif: row.fourth
        )
      end      
    end

    puts 'Merchants imported...'
    puts 'Importing shoppers...'    
    
    Import.where(status: :active, import_type: :shopper).each do |shopper|
      shopper.update(status: :finished)

      CSV.parse(shopper.file.download, headers: false) do |row|
        Shopper.create(
          id_csv: row.first,
          name: row.second,
          email: row.third,
          nif: row.fourth
        )
      end          
    end

    puts 'Shoppers imported...'
    puts 'Importing orders...'    

    Import.where(status: :active, import_type: :order).each do |order|
      order.update(status: :finished)

      CSV.parse(order.file.download, headers: false) do |row|
        order = Order.create(
          id_csv: row.first,
          merchant: Merchant.find_by_id_csv(row.second),
          shopper: Shopper.find_by_id_csv(row.third),
          amount: row.fourth,
          created: row.fifth,
          completed: row.last,
          status: :processed
        )
      end      
    end
    
    puts 'Orders imported...'    
    puts 'Imports finished'    
  end
end
