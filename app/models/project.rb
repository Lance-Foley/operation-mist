class Project < ApplicationRecord
  has_many :jobs, dependent: :delete_all, autosave: true
  
  has_one :client
  private def create_or_update(touch: nil, **)

    super
  end

  def changed_for_autosave?
    super
  end

  def changes_to_save
    self.e_rating = Job.where(project_id: id, completed: true).average(:E_rating)
    super
  end
end
