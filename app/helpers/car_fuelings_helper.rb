module CarFuelingsHelper
  def format_avg(avg)
    "1 : #{avg.round(1)}"
  end
end
