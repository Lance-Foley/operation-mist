class VariancesController < ApplicationController
  before_action :set_variance, only: %i[ show edit update destroy ]

  # GET /variances or /variances.json
  def index
    @variances = Variance.all
  end

  # GET /variances/1 or /variances/1.json
  def show
  end

  # GET /variances/new
  def new
    @variance = Variance.new
  end

  # GET /variances/1/edit
  def edit
  end

  # POST /variances or /variances.json
  def create
    @variance = Variance.new(variance_params)

    respond_to do |format|
      if @variance.save
        format.html { redirect_to variance_url(@variance), notice: "Variance was successfully created." }
        format.json { render :show, status: :created, location: @variance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @variance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /variances/1 or /variances/1.json
  def update
    respond_to do |format|
      if @variance.update(variance_params)
        format.html { redirect_to dashboard_index_path, notice: "Variance was successfully updated." }
        format.json { render :show, status: :ok, location: @variance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @variance.errors, status: :unprocessable_entity }
      end
    end
    Employee.find_each(&:save)
  end

  # DELETE /variances/1 or /variances/1.json
  def destroy
    @variance.destroy

    respond_to do |format|
      format.html { redirect_to variances_url, notice: "Variance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_variance
    @variance = Variance.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def variance_params
    params.require(:variance).permit(:hour_variance, :hour_rate)
  end
end
