class CarModelsController < ApplicationController
  before_action :set_car_model, only: %i[ show edit update destroy ]

  # GET /cars or /cars.json
  def index
    if params[:brand_id].present?
      @car_models = CarModel.where(car_brand_id: params[:brand_id])
    else
      @car_models = CarModel.all
    end
    @car_models = CarModel.paginate(page: params[:page], per_page: 20)
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car_model = CarModel.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car_model = CarModel.new(car_model_params)

    respond_to do |format|
      if @car_model.save
        format.html { redirect_to @car_model, notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car_model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car_model.update(car_model_params)
        format.html { redirect_to @car_model, notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car_model }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car_model = CarModel.find(params[:id])
        @car_model.destroy

    respond_to do |format|
      format.html { redirect_to car_models_path, status: :see_other, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car_model
      @car_model = CarModel.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def car_model_params
      params.expect(car_model: [ :brand, :model, :year, :created_at, :updated_at ])
    end
end
