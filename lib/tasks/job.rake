namespace :job do
  desc "Updates Hours for each phase record"
  task update_all_hours: :environment do

    # Job.where('updated_at > ?', 1.days.ago).update_all({ private: true })
    job = Job.all
    job.each do |j|
      j.update_attribute(:hours_remaining, job.hours_remaining * 1)
    end
  end

end
