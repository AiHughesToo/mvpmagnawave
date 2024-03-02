json.extract! nomination, :id, :nom_type, :sender_id, :sender_name, :user_id, :receiver_name, :receiver_img_link, :nom_body, :created_at, :updated_at
json.url nomination_url(nomination, format: :json)
