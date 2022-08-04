class JobPolicy

  def initialize(user, job)
    @user = user
    @job = job
  end

  def is_admin?
    user.role == ‘admin’
  end
end