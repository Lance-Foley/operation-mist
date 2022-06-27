class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :role
end
