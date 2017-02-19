json.extract! charge, :id, :title, :period, :price, :paid_by, :paid_at, :status, :created_at, :updated_at
json.url charge_url(charge, format: :json)