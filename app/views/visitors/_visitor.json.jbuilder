json.extract! visitor, :id, :first_name, :last_name, :email, :phone, :message, :created_at, :updated_at
json.url visitor_url(visitor, format: :json)