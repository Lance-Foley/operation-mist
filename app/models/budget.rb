class Budget < ApplicationRecord

  private def create_or_update(touch: nil, **)
    @jobs = Job.all
    self.income = 0
    today = Time.now.midnight.to_datetime
    Job.where("start_date >= budget.start_date AND end_date <= budget.end_date", { start_date: params[:start_date], end_date: params[:end_date] })
    Job.where(start_date: Budget.first.start_date).all
  end
end
