# Preview all emails at http://localhost:3000/rails/mailers/delivery_notification_mailer
class DeliveryNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/delivery_notification_mailer/welcome
  def welcome
    DeliveryNotificationMailer.welcome
  end

end
