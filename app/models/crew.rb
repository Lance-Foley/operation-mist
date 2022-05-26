class Crew < ApplicationRecord
  belongs_to :division
  has_many :jobs
  has_many :employees

  private def create_or_update(touch: nil, **)

    super
  end

end
