class ProjectSerializer < ActiveModel::Serializer
  attributes :name, :start_date, :end_date, :total_cost_per_day
end