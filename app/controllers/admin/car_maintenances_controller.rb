module Admin
  class CarMaintenancesController < AdminBaseController
    before_action :authenticate_user!
    before_action :set_car_maintenance, only: %i[ show edit update destroy ]

    # GET /car_maintenances
    def index
      @car_maintenances = CarMaintenance.order(performed_at: :desc)
      if params[:search].present?
        @car_maintenances = @car_maintenances.where(
          "LOWER(description) LIKE ?", "%#{params[:search].downcase}%"
        )
      end
      @car_maintenances = @car_maintenances.paginate(page: params[:page], per_page: 15)

      respond_to do |format|
        format.json { render json: MaintenanceSerializer.new(@car_maintenances).serialize }
        format.html
      end
    end

    # GET /car_maintenances/1
    def show
      respond_to do |format|
        format.json { render json: MaintenanceSerializer.new(@car_maintenance).serialize }
        format.html
      end
    end

    # GET /car_maintenances/new
    def new
      @car_maintenance = CarMaintenance.new
    end

    # GET /car_maintenances/1/edit
    def edit
      # sudah otomatis pakai @car_maintenance dari before_action
    end

    # POST /car_maintenances
    def create
      @car_maintenance = CarMaintenance.new(car_maintenance_params)

      respond_to do |format|
        if @car_maintenance.save
          format.html { redirect_to admin_car_maintenance_path(@car_maintenance), notice: t("car_maintenances.created") }
          format.json { render :show, status: :created, location: @car_maintenance }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @car_maintenance.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /car_maintenances/1
    def update
      respond_to do |format|
        if @car_maintenance.update(car_maintenance_params)
          format.html { redirect_to admin_car_maintenance_path(@car_maintenance), notice: t("car_maintenances.updated") }
          format.json { render :show, status: :ok, location: @car_maintenance }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @car_maintenance.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /car_maintenances/1
    def destroy
      @car_maintenance.destroy!
      respond_to do |format|
        format.html { redirect_to admin_car_maintenances_path, status: :see_other, notice: t("car_maintenances.destroyed") }
        format.json { head :no_content }
      end
    end

    private

      def set_car_maintenance
        @car_maintenance = CarMaintenance.find(params[:id])
      end

      def car_maintenance_params
        params.require(:car_maintenance).permit(:car_id, :title, :maintenance_type, :description, :performed_at)
      end
  end
end
