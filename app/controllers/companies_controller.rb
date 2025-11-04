class CompaniesController < ApplicationController
    def show
        @company = current_user.company
    end
end
