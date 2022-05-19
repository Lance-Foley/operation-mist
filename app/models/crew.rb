class Crew < ApplicationRecord
  belongs_to :division


  after_initialize :set_default_division_id, :if => :new_record?

  def set_default_division_id
    self.division_id = Division.all.first.id
  end

  private def create_or_update(touch: nil, **)

    super
  end

end
