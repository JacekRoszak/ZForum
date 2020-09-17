json.extract! user, :id, :name, :password, :admin, :superadmin, :created_at, :updated_at
json.url user_url(user, format: :json)
