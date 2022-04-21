class CrewsController < ApplicationController
  before_action :set_crew, only: %i[ show edit update destroy ]

  # GET /crews or /crews.json
  def index
    @crews = Crew.all
  end

  # GET /crews/1 or /crews/1.json
  def show
  end

  # GET /crews/new
  def new
    @crew = Crew.new
  end

  # GET /crews/1/edit
  def edit
  end

  # POST /crews or /crews.json
  def create
    @crew = Crew.new(crew_params)

    respond_to do |format|
      if @crew.save
        format.html { redirect_to crew_url(@crew), notice: "Crew was successfully created." }
        format.json { render :show, status: :created, location: @crew }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /crews/1 or /crews/1.json
  def update
    respond_to do |format|
      if @crew.update(crew_params)
        format.html { redirect_to crew_url(@crew), notice: "Crew was successfully updated." }
        format.json { render :show, status: :ok, location: @crew }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crew.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /crews/1 or /crews/1.json
  def destroy
    @crew.destroy

    respond_to do |format|
      format.html { redirect_to crews_url, notice: "Crew was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_crew
      @crew = Crew.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crew_params
      params.require(:crew).permit(:name, :contracted_hours_per_week, :available_hours_per_week, :contracted_hours_per_month, :available_hours_per_month, :contracted_hours_three_months, :available_hours_three_months, :contracted_hours_six_months, :available_hours_six_months, :contracted_hours_nine_months, :available_hours_nine_months, :contracted_hours_twelve_months, :available_hours_twelve_months)
    end
end
