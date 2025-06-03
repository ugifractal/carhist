class CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :check_car_limit, only: [ :new, :create ]
  before_action :authenticate_api_key!

  # GET /cars or /cars.json
  def index
    @cars = current_user.cars.order(name: :asc)
  end

  # GET /cars/1 or /cars/1.json
  def show
    @car = Car.find(params[:id])
  end

  # GET /cars/new
  def new
    @car = current_user.cars.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = current_user.cars.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy!

    respond_to do |format|
      format.html { redirect_to cars_path, status: :see_other, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def car_params
      params.expect(car: [ :user_id, :name, :year, :car_model_id, :created_at, :updated, :image ])
    end

    def check_car_limit
      limit = current_user.plan == "free" ? 2 : 6
      if current_user.cars.count >= limit
        redirect_to cars_path, alert: t("alerts.car_limit_reached")
      end
    end

    def authenticate_api_key!
      input_key = request.headers['api-key']

      authorized = ApiKey.all.any? do |api_key|
        BCrypt::Password.new(api_key.key_digest).is_password?(input_key)
      end

      unless authorized
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end

end
