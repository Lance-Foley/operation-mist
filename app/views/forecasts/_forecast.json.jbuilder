json.extract! forecast, :id, :created_at, :updated_at
json.url forecast_url(forecast, format: :json)
