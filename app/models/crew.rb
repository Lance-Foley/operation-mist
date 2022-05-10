class Crew < ApplicationRecord
  has_many :employees
  has_many :jobs
  private def create_or_update(touch: nil, **)

    super
  end

end
