class PhasesController < ApplicationController
  before_action :set_phase, only: %i[ show edit update destroy ]

  # GET /phases or /phases.json
  def index
    @phases = Phase.all
  end

  # GET /phases/1 or /phases/1.json
  def show
    @phase = Phase.find(params[:id])

  end

  # GET /phases/new
  def new
    @phase = Phase.new
  end

  # GET /phases/1/edit
  def edit
    @phase = Phase.find(params[:id])

  end

  # POST /phases or /phases.json
  def create
    @phase = Phase.new(phase_params)

    respond_to do |format|
      if @phase.save
        format.html { redirect_to phase_url(@phase), notice: "Phase was successfully created." }
        format.json { render :show, status: :created, location: @phase }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /phases/1 or /phases/1.json
  def update
    respond_to do |format|
      if @phase.update(phase_params)
        format.html { redirect_to phase_url(@phase), notice: "Phase was successfully updated." }
        format.json { render :show, status: :ok, location: @phase }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phases/1 or /phases/1.json
  def destroy
    @phase = Phase.find(params[:id])

    @phase.destroy

  redirect_to phases_path, status: :see_other, notice: "Phase was successfully destroyed."

  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_phase
    @phase = Phase.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def phase_params
    params.require(:phase).permit(:name)
  end
end
