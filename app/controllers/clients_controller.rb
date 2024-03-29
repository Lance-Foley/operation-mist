class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy ]

  def projects
    # todo turn into a partial render on client show view
    @client = Client.find(params[:id])
    @projects = @client.projects
    @client_id = Client.find_by_id(params[:id])
    @project = Project.new
  end

  # GET /clients or /clients.json
  def index
    @q = Client.ransack(params[:q])
    @clients = @q.result(distinct: true)

  end

  # GET /clients/1 or /clients/1.json
  #  todo render clients on main screen after login
  def show
    @projects = @client.projects

  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients or /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to client_url(@client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1 or /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to client_url(@client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1 or /clients/1.json
  def destroy
    @project = Project.where("client_id = ?", params[:id]).all
    if @project
      @project.each do |project|
        project.destroy
      end
    else
    end

    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_path, status: :see_other, notice: "Client was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_client
    @client = Client.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def client_params
    params.require(:client).permit(:name, :address, :phone_number,
                                   :email, :future_address, :cell_phone, :created_at, :updated_at,)
  end
end
