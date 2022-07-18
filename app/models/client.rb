class Client < ApplicationRecord
  has_many :projects, dependent: :delete_all
  validates :name, presence: true
  # TODO Validate MODEL TO MAKE CLIENT NAME TRUE
  #
end
