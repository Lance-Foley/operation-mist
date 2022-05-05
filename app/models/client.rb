class Client < ApplicationRecord
  has_many :projects, dependent: :delete_all

end
