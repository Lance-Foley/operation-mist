class Division < ApplicationRecord
  has_many :crews
  has_many :jobs
  enum utilization: [:billable, :nonbillable]
  after_initialize :set_default_utilization, :if => :new_record?

  def set_default_utilization
    self.utilization ||= :billable
  end

  private def create_or_update(touch: nil, **)

    super

  end

end
