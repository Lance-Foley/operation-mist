class Employee < ApplicationRecord
  # has_one :crew

  enum tier: [:Tier_1, :Tier_2, :Tier_3, :Tier_4]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.tier ||= :tier_4
  end

  private def create_or_update(touch: nil, **)

    self.true_man_hours_per_week = (man_hours_per_week * 0.71).round(1)
    self.man_hours_per_month = (true_man_hours_per_week * 4.3)
    self.man_hours_three_months = (man_hours_per_month * 3)
    self.man_hours_six_months = (man_hours_per_month * 6)
    self.man_hours_nine_months = (man_hours_per_month * 9)
    self.man_hours_twelve_months = (man_hours_per_month * 12)

    super
  end
end
