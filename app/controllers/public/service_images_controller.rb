module Public
  class ServiceImagesController < ApplicationController
    layout "welcome"

    def show
      @history_image = HistoryImage.find_by!(token: params[:token])
      @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
    end
  end
end
