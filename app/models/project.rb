class Project < ApplicationRecord
  belongs_to :client
  has_many :jobs, dependent: :delete_all, autosave: true

  private def create_or_update(touch: nil, **)
    self.number_of_days = (end_date - start_date).to_i

    if sub_cost > 0.0
      if number_of_days > 1
        self.sub_cost_per_day = (sub_cost / number_of_days).to_f.round(2)
      else
        self.sub_cost_per_day = sub_cost
      end
    else
      self.sub_cost_per_day = 0
    end

    if cost > 0.0
      if number_of_days > 1
        self.total_cost_per_day = (cost / number_of_days).to_f.round(2)
      else
        self.total_cost_per_day = cost
      end
    else
      self.cost = 0
    end

    if cost > sub_cost and number_of_days > 0
      self.project_cost_per_day = ((cost - sub_cost) / number_of_days).to_f.round(2)
    else
      self.project_cost_per_day = 0
    end

    super
  end

  def changed_for_autosave?
    super
  end

end
