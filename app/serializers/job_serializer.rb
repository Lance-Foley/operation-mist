class JobSerializer < ActiveModel::Serializer
  attributes :crew_id, :start_date, :end_date, :man_hours

end
