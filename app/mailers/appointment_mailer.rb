class AppointmentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.new_appointment.subject
  #
  def new_appointment(appointment)
   	@appointment = appointment

    mail to: "salonheadsph@gmail.com",
     subject: "New Appointment by  #{@appointment.user.try(:email)} "
  end


  def approved_appointment(appointment)
   	@appointment = appointment

    mail to: @appointment.user.email ,
     subject: "Approved Appointment on Heads Salon "
  end


end
