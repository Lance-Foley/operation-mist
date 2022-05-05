class Employee < ApplicationRecord
  # has_one :crew

  private def create_or_update(touch: nil, **)

    self.true_man_hours_per_week = (man_hours_per_week * 0.71).round(1)
    self.man_hours_per_month = (true_man_hours_per_week * 4.3).round(1)
    self.man_hours_three_months = (man_hours_per_month * 3).round(1)
    self.man_hours_six_months = (man_hours_per_month * 6).round(1)
    self.man_hours_nine_months = (man_hours_per_month * 9).round(1)
    self.man_hours_twelve_months = (man_hours_per_month * 12).round(1)

    super
  end
end
