class CrewSerializer < ActiveModel::Serializer
  attributes :name, :current

  has_many :jobs

  def current
    0
  end

end
