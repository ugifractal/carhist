class CompaniesController < ApplicationController
  def show
    @company = current_user.company
  end

  def edit
    @company = current_user.company
  end

  def update
    @company = current_user.company
    if @company.update(company_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to company_path, notice: t("controller.companies.updated") }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def company_params
    params.require(:company).permit(:name)
  end
end
