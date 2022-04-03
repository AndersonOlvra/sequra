json.extract! order, :id, :id_csv, :merchant_id, :shopper_id, :amount, :created, :completed, :status, :disburse, :created_at, :updated_at
json.url order_url(order, format: :json)
