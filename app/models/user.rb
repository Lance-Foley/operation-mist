class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  belongs_to :role, optional: true

  validates :name, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z]+\z/ }, length: { minimum: 3, maximum: 50 }
  validates :email, uniqueness: true, presence: true

  before_save :assign_role

  def assign_role
    self.role = Role.find_by name: 'Sales' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end

  def manager?
    role.name == 'Manager'
  end

  def sales?
    role.name == 'Sales'
  end
end
