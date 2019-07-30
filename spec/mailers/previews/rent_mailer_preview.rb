# Preview all emails at http://localhost:3000/rails/mailers/rent_mailer
class RentMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/rent_mailer/new_recor_notification
  def new_recor_notification
    RentMailer.new_recor_notification
  end
end
