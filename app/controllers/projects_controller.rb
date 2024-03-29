class ProjectsController < ApplicationController
  # helper :projects
  before_action :set_project, only: %i[ show edit update destroy ]

  def phase
    @project = Project.find(params[:id])
    @jobs = @project.jobs
    @project_id = Project.find_by_id(params[:id])
    @job = Job.new
  end

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    @jobs = @project.jobs
    @total_bid_hours = Job.where(project_id: @project.id).sum(:man_hours)
    @project_cost = (@project.material_cost + @project.actual_sub_cost) + @total_bid_hours * Variance.first.hour_rate.to_s.to_d
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to client_projects_path(@project.client_id), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def current_user?
    @current_user ||= User.find_by(id: session[:user_id])
    # code here
  end

  def update

    respond_to do |format|
      if @project.update(project_params)
        if current_user.admin?
          format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        else
          format.html { redirect_to projects_path, notice: "Project was successfully updated." }

        end
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path, status: :see_other, notice: "Project was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:name, :client_id, :project_manager, :info,
                                    :start_date, :end_date, :cost, :sub_cost, :material_cost, :actual_material_cost, :actual_sub_cost)
  end

end
