class JobSerializer < ActiveModel::Serializer
  attributes :phase, :start_date, :end_date

  belongs_to :project
end
