class SubscriptionMailer < ApplicationMailer
  default from: 'hcao008@gmail.com'
  layout 'mailer'

  def send_email(email,blog)
  @blog = blog
  mail(to: email, subject: 'hello')
end

end
