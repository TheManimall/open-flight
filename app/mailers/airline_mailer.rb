class AirlineMailer < ApplicationMailer
  default from: 'open-flygths@mail.ua'

  def send_email
    mail(to: "admin@email.com", subject: 'Sample email')
  end
end
