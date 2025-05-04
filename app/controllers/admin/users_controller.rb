module Admin
    class UsersController < AdminBaseController
      def index
        @users = User.order(email: :asc)
      end
      
      def edit
        @user = User.find(params[:id])
      end

      def update
        @user = User.find(params[:id])
        if @user.update(user_params)
          redirect_to admin_users_path, notice: "User updated successfully"
        else
          render :edit
        end
      end      

      def user_params
        params.require(:user).permit(:email, :plan)
      end
      
    end
  end
