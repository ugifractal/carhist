class CompaniesController < ApplicationController
    def show
        @company = current_user.company
        @api_key = @company.api_keys.find(params[:id])
    end
end
