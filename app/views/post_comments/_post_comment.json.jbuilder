json.extract! post_comment, :id, :content, :postcomment_id, :user_id, :post_id, :created_at, :updated_at
json.url post_comment_url(post_comment, format: :json)
