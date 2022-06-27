class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update destroy ]
  # todo add associations to projects create form and view for jobs inside of project id
  # GET /jobs or /jobs.json
  #
  @today = Date.current

  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true)

  end

  # GET /jobs/1 or /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
    @job.build_crew
    @job.build_division
    
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs or /jobs.json
  def create

    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to project_phase_path(@job.project_id), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to job_url(@job), notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1 or /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    redirect_to project_phase_path(@job.project_id), status: :see_other, notice: "Job was successfully destroyed."

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Job.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def job_params
    params.require(:job).permit!
  end
end
