json.extract! merchant, :id, :id_csv, :name, :email, :cif, :created_at, :updated_at
json.url merchant_url(merchant, format: :json)
