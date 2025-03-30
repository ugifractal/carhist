class HomeController < ApplicationController
    def home
    end

    def destroy
        redirect_to home_path
    end
end
