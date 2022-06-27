class ProjectLeadController < ApplicationController
  def index
    @projects = Project.all
    @jobs = Job.all
  end
end
