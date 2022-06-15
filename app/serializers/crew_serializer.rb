class CrewSerializer < ActiveModel::Serializer
  attributes :name, :current, :deals

  def current
    0
  end

  def deals
    object.jobs.map { |job| { project: Project.where(id: job.project_id).first.name, client: Client.joins(:projects).where(:projects => { :id => job.project_id }).first.name, phase: job.phase, from: job.start_date, to: job.end_date } }
  end
end
