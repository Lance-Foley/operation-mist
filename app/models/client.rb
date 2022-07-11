class Client < ApplicationRecord
  has_many :projects, dependent: :delete_all
  # TODO Validate MODEL TO MAKE CLIENT NAME TRUE
end
