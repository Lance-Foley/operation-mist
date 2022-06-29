class ForecastSerializer < ActiveModel::Serializer
  attributes :id, :years, :filtered_project_years

  def years
    object.projects.map { |project| { year: project.select(created_at:) } }
  end

  def filtered_project_years
    # object.projects.map { |project| { year: project.created_at } }
    "Hello"
  end
end
