json.extract! comment, :id, :blog_id, :name, :comment, :created_at, :updated_at
json.url comment_url(comment, format: :json)