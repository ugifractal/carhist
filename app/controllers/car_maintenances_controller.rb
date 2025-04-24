class CarMaintenancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car
  before_action :set_car_maintenance, only: %i[ show edit update destroy ]

  # GET /car_maintenances or /car_maintenances.json
  def index
    @car_maintenances = @car.car_maintenances.paginate(per_page: 20, page: params[:page])
  end

  # GET /car_maintenances/1 or /car_maintenances/1.json
  def show
  end

  # GET /car_maintenances/new
  def new
    @car_maintenance = CarMaintenance.new
  end

  # GET /car_maintenances/1/edit
  def edit
  end

  # POST /car_maintenances or /car_maintenances.json
  def create
    @car_maintenance = @car.car_maintenances.new(car_maintenance_params)

    respond_to do |format|
      if @car_maintenance.save
        format.html { redirect_to car_car_maintenance_path(@car, @car_maintenance), notice: "Car maintenance was successfully created." }
        format.json { render :show, status: :created, location: @car_maintenance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car_maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /car_maintenances/1 or /car_maintenances/1.json
  def update
    respond_to do |format|
      if @car_maintenance.update(car_maintenance_params)
        format.html { redirect_to car_car_maintenance_path(@car, @car_maintenance), notice: "Car maintenance was successfully updated." }
        format.json { render :show, status: :ok, location: @car_maintenance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car_maintenance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /car_maintenances/1 or /car_maintenances/1.json
  def destroy
    @car_maintenance.destroy!

    respond_to do |format|
      format.html { redirect_to car_maintenances_path, status: :see_other, notice: "Car maintenance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_car
    @car = current_user.cars.find(params[:car_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_car_maintenance
      @car_maintenance = @car.car_maintenances.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def car_maintenance_params
      params.expect(car_maintenance: [ :maintenance_type, :description ])
    end
end
