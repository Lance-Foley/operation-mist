class ApplicationController < ActionController::Base


  protected

  def configure_permitted_parameters
    added_attrs = [:email, :password, :password_conformation, :remember_me, :name]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)

  end

  def prepare_job_form
    @job_form = Job.create
  end

end
