class MaintenanceSettingsController < ApplicationController
  def show
    @car = Car.find(params[:car_id])
    @maintenance_setting = @car.maintenance_setting || @car.build_maintenance_setting
  end

  def update
    @car = Car.find(params[:car_id])
    @maintenance_setting = @car.maintenance_setting

    if @maintenance_setting.update(maintenance_setting_params)
      redirect_to car_maintenance_setting_path(@car), notice: "#{t('views.item.maintenance_setting')} #{t('views.flash.notice_updated')}."
    else
      render :show
    end
  end

  private

  def maintenance_setting_params
    params.require(:maintenance_setting).permit(:engine_oil_change_interval, :transmission_oil_change_interval)
  end
end
