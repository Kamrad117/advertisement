json.extract! post, :id, :name, :short_description, :description, :type, :created_at, :updated_at
json.url post_url(post, format: :json)
