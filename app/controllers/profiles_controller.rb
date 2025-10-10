class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      flash[:notice] = "Profile has been successfully updated."
      redirect_to(edit_profiles_path)
    else
      render action: "edit"
    end
  end

  private

  def profile_params
    params.expect(user: %i[ timezone image language])
  end
end
