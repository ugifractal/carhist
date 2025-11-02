class ProvincesController < ApplicationController
  def regencies
    province = Province.find(params[:id])
    regencies = province.regencies

    render json: { regencies: regencies.map { |x| RegencySerializer.new(x).to_h } }
  end

  def districts
    regency = Regency.find(params[:id])

    render json: { districts: regency.districts.map { |x| DistrictSerializer.new(x).to_h } }
  end

  def villages
    district = District.find(params[:id])

    render json: { villages: district.villages.map { |x| VillageSerializer.new(x).to_h } }
  end
end
