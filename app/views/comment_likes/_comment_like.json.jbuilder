json.extract! comment_like, :id, :user_id, :comment_id, :created_at, :updated_at
json.url comment_like_url(comment_like, format: :json)
