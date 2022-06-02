class JobSerializer < ActiveModel::Serializer
  attributes :phase, :start_date, :end_date, :man_hours

end
