module Admin
  class CarBrandsController < AdminBaseController
    before_action :set_car_brand, only: %i[ show edit update destroy ]

    # GET /car_brands or /car_brands.json
    def index
      @car_brands = CarBrand.order(name: :asc).paginate(page: params[:page], per_page: 20)
    end

    # GET /car_brands/1 or /car_brands/1.json
    def show
    end

    # GET /car_brands/new
    def new
      @car_brand = CarBrand.new
    end

    # GET /car_brands/1/edit
    def edit
    end

    # POST /car_brands or /car_brands.json
    def create
      @car_brand = CarBrand.new(car_brand_params)

      respond_to do |format|
        if @car_brand.save
          format.html { redirect_to admin_car_brands_path, notice: "Car Brand Successfully Created." }
          format.json { render :show, status: :created, location: @car_brand }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @car_brand.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /car_brands/1 or /car_brands/1.json
    def update
      respond_to do |format|
        if @car_brand.update(car_brand_params)
          format.html { redirect_to admin_car_brand_path(@car_brand), notice: "Car Brand Successfully Updated." }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @car_brand.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /car_brands/1 or /car_brands/1.json
    def destroy
      @car_brand.destroy!

      respond_to do |format|
        format.html { redirect_to admin_car_brands_path, status: :see_other, notice: "Car Brand Successfully Deleted." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_car_brand
        @car_brand = CarBrand.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def car_brand_params
        params.expect(car_brand: [ :name ])
      end
  end
end
