json.extract! comments_comment, :id, :content, :user_id, :postcomment_id, :created_at, :updated_at
json.url comments_comment_url(comments_comment, format: :json)
