class UserMailer < ApplicationMailer
  def test(email = "ugidmtest@gmail.com")
    mail(
      to: email,
      subject: "Test SMTP email",
      layout: false
    )
  end
end