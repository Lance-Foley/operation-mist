class Crew < ApplicationRecord
  belongs_to :division
  has_many :employees
  has_many :jobs

  after_initialize :set_default_division_id, :if => :new_record?

  def set_default_division_id
    self.division_id = 0
  end

  private def create_or_update(touch: nil, **)

    super
  end

end
