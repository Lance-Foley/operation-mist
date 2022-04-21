json.extract! employee, :id, :name, :crew, :division, :man_hours_per_week, :man_hours_per_month, :man_hours_three_months, :man_hours_six_months, :man_hours_nine_months, :man_hours_per_twelve_months, :contr_hours_per_week, :contr_hour_per_month, :contr_hours_three_months, :contr_hours_nine_months, :contr_hours_twelve_months, :created_at, :updated_at
json.url employee_url(employee, format: :json)
