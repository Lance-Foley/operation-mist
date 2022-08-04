class UsersPolicy
  def initialize(user)
    @user = user
  end

  def admin?
    @user.where(admin: true)
  end

  def manager?
    @user.where(manager: true)
  end

  def sales?
    @user.where(sales: true)
  end

  def user?
    @user.where(user: true)
  end

end