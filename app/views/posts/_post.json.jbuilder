json.extract! post, :id, :user_id, :content, :topic_id, :important, :created_at, :updated_at
json.url post_url(post, format: :json)
