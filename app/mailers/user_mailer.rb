class UserMailer < ApplicationMailer
  def test
    mail(
      to: "ugidmtest@gmail.com",
      subject: "Testing",
      layout: false
    )
  end
end
