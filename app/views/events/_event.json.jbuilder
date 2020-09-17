json.extract! event, :id, :user_id, :content, :link, :graphic, :start_date, :created_at, :updated_at
json.url event_url(event, format: :json)
