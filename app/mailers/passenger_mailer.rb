class PassengerMailer < ApplicationMailer
  default from: 'confirmations@example.com'

  def confirmation_email
    @passengers = params[:passengers]
    @confirmation_number = params[:confirmation_number]
    @passengers.each do |passenger|
      @passengers = passenger
      mail(to: passenger.email, subject: 'Your flights been booked!')
    end
  end
end
