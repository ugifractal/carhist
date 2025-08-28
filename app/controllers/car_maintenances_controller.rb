class CarMaintenancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car
  before_action :set_car_maintenance, only: %i[ show edit update destroy manage_photos ]
  before_action :set_collections, only: [ :new, :edit, :create, :update ]

  # GET /car_maintenances or /car_maintenances.json
  def index
    if params[:search].present?
      @car_maintenances = @car.car_maintenances
        .where("LOWER(description) LIKE ?", "%#{params[:search].downcase}%")
        .order(performed_at: :desc)
        .paginate(page: params[:page], per_page: 15)
    else
      @car_maintenances = @car.car_maintenances
        .order(performed_at: :desc)
        .paginate(page: params[:page], per_page: 15)
    end
    respond_to do |format|
      format.json do
        render json: MaintenanceSerializer.new(@car_maintenances).serialize
      end
      format.html
      end
  end

  # GET /car_maintenances/1 or /car_maintenances/1.json
  def show
    respond_to do |format|
      format.json do
        render json: MaintenanceSerializer.new(@car_maintenance).serialize
      end
      format.html
      end
  end

  # GET /car_maintenances/new
  def new
    @car_maintenance = @car.car_maintenances.new(filled_at: Time.zone.now)
    @car_shops = CarShop.all
  end

  # GET /car_maintenances/1/edit
  def edit
    @car_shops = CarShop.all
  end

  # POST /car_maintenances or /car_maintenances.json
  def create
    @car_maintenance = @car.car_maintenances.new(car_maintenance_params)

    respond_to do |format|
      if @car_maintenance.save
        format.html { redirect_to car_car_maintenance_history_images_path(@car, @car_maintenance), notice: "#{t('views.item.car_maintenance')} #{t('views.flash.notice_created')}." }
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
        format.html { redirect_to car_car_maintenances_path, notice: "#{t('views.item.car_maintenance')} #{t('views.flash.notice_updated')}." }
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
      format.html { redirect_to car_car_maintenances_path, status: :see_other, notice: "#{t('views.item.car_maintenance')} #{t('views.flash.notice_deleted')}." }
      format.json { head :no_content }
    end
  end

  def manage_photos
  end

  def export_pdf
    @car = Car.find(params[:car_id])
    pdf_data = @car.generate_maintenance_pdf
    @car_maintenances = @car.car_maintenances.order(performed_at: :desc)

    send_data pdf_data,
              filename: "maintenance_report_#{@car.name.parameterize}_#{Time.current.strftime('%Y%m%d')}.pdf",
              type: "application/pdf",
              disposition: "attachment"
  end

  private

  def set_car
    @car = current_user.company.cars.find(params[:car_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_car_maintenance
    @car_maintenance = @car.car_maintenances.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def car_maintenance_params
    params.require(:car_maintenance).permit(:car_id, :title, :maintenance_type, :description, :performed_at, :car_shop_id)
  end

  def set_collections
    @car_shops = current_user.company.car_shops.order(name: :asc)
  end
end
