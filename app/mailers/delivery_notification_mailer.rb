class DeliveryNotificationMailer < ApplicationMailer
  default from: 'hcao008@gmail.com'
  layout 'mailer'

  def welcome(abc)
    @greeting = "Hi"
    @person = abc

    mail to: "hcao008@gmail.com", subject: 'Contact form'
  end


end
