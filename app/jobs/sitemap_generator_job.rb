class SitemapGeneratorJob < ApplicationJob
  queue_as :low

  def perform
    generate_xml
  end

  def generate_xml
    filename = "#{ENV.fetch('SITEMAP_FOLDER')}/sitemap-tmp-1.xml"
    File.open(filename, "wb") do |f|
      f.puts "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
      f.puts "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">"
      Car.for_sale.find_each do |car|
        f.puts build_tag("#{ENV.fetch("APP_URL")}/public/marketplace/#{car.car_sell.token}", car.car_sell.updated_at)

        car.car_sell.car_sell_images.each do |ci|
          f.puts(build_tag("#{ENV.fetch("APP_URL")}#{ci.image_url(:medium)}", car.car_sell.updated_at))
        end
      end
      f.puts "</urlset>"
    end

    original = "#{ENV.fetch('SITEMAP_FOLDER')}/sitemap.xml"
    FileUtils.mv(filename, original, force: true)
  end


  private
  def build_tag(url, date)
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.url do
        xml.loc url
        xml.lastmod date.strftime("%Y-%m-%d")
      end
    end
    builder.doc.root.to_s
  end
end
