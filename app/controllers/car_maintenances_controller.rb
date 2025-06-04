class CarMaintenancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car
  before_action :set_car_maintenance, only: %i[ show edit update destroy manage_photos ]

  # GET /car_maintenances or /car_maintenances.json
  def index
    if params[:search].present?
      @car_maintenances = @car.car_maintenances
        .where("LOWER(description) LIKE ?", "%#{params[:search].downcase}%")
        .order(performed_at: :desc)
        .paginate(page: params[:page], per_page: 5)
    else
      @car_maintenances = @car.car_maintenances
        .order(performed_at: :desc)
        .paginate(page: params[:page], per_page: 5)
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
    @car_maintenance = @car.car_maintenances.new
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

  def manage_photos
  end

  def export_pdf
    @car = Car.find(params[:car_id])
    @car_maintenances = @car.car_maintenances.order(performed_at: :desc)

    pdf = Prawn::Document.new
    pdf.text "Maintenance Report for #{@car.name} (#{@car.car_model.car_brand.name})", size: 16, style: :bold
    pdf.move_down 10

    if @car_maintenances.any?
      table_data = [ [ "Date", "Type", "Photo Count" ] ]
      @car_maintenances.each do |m|
        date = m.performed_at&.strftime("%d %b %Y")
        type = m.maintenance_type.humanize
        photo_count = m.history_images.count
        table_data << [ date, type, photo_count.to_s ]
      end

      pdf.table(table_data, header: true, row_colors: [ "F0F0F0", "FFFFFF" ], cell_style: { borders: [] })
    else
      pdf.text "No maintenance records found.", style: :italic
    end

    send_data pdf.render,
              filename: "maintenance_report_#{@car.name.parameterize}_#{Time.current.strftime('%Y%m%d')}.pdf",
              type: "application/pdf",
              disposition: "attachment"
  end

  private

  def set_car
    @car = current_user.cars.find(params[:car_id])
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_car_maintenance
      @car_maintenance = @car.car_maintenances.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def car_maintenance_params
      params.require(:car_maintenance).permit(:car_id, :title, :maintenance_type, :description, :performed_at)
    end
end
