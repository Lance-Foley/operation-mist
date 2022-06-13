class CrewSerializer < ActiveModel::Serializer
  attributes :crew_jobs

  def current
    0
  end

  def crew_jobs
    object.jobs.map { |job| { project: job.project_id.to_s, from: job.start_date.to_datetime, to: job.end_date.to_datetime } }
  end
end
