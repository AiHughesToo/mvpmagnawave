json.extract! stat, :id, :user_id, :noms_sent, :noms_received, :mvp_wins, :created_at, :updated_at
json.url stat_url(stat, format: :json)
