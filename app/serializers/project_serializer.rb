class ProjectSerializer < ActiveModel::Serializer
  attributes :year, :month, :total_cost, :sub_cost, :filtered_project_years

  def year
    "Year"
    object.projects.map { |p| { year: Project.where('created_at > ?', '2022-01-01').where('created_at < ?', '2023-01-01') } }
    object.jobs.map { |job| { project: Project.where(id: job.project_id).first.name, client: Client.joins(:projects).where(:projects => { :id => job.project_id }).first.name, phase: job.phase, from: job.start_date, to: job.end_date + 1.days } }

  end

  def month
    "Month"
  end

  def total_cost
    "Total Cost"
  end

  def sub_cost
    "Sub Cost"
  end

  def filtered_project_years
    # object.projects.map { |project| { year: project.created_at } }
    "Hello"
  end
end