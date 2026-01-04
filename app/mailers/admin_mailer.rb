class AdminMailer < ApplicationMailer
  def notify_signup
    @user = params[:user]
    @email = params[:email]

    mail(
      to: @email,
      subject: "#{@user.email} has signed up to carhist",
      layout: false
    )
  end
end
