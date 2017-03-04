json.extract! event, :id, :date, :type, :area, :meeting_time, :meeting_place, :created_at, :updated_at
json.url event_url(event, format: :json)