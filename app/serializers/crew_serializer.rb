class CrewSerializer < ActiveModel::Serializer
  attributes :name, :current, :deals

  def current
    0
  end

  def deals
    object.jobs.map { |job| { project: job.project_id.to_s, from: job.start_date, to: job.end_date } }
  end
end
