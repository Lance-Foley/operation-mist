json.extract! job, :id, :name, :start_date, :end_date, :crew, :man_hours, :phase, :division, :total_cost, :sub_cost, :hours_per_week, :weeks, :week_remaining, :hours_remaining, :three_month_hours, :six_month_hours, :nine_month_hours, :twelve_month_hours, :created_at, :updated_at
json.url job_url(job, format: :json)
