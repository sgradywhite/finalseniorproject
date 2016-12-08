class AppointmentMailer < ApplicationMailer

    def confirm_appointment(user, createdtime, stats)
      @user = user
      @time = createdtime
      @status = stats
      @appointment = Appointment.all
     
      
          
           mail to: user.email, subject: "Confirm Appointment "
          
    end  
    
    def confirm_appointment_for_doctor(user, createdtime, stats)
      @user = user
      @time = createdtime
      @status = stats
      @appointment = Appointment.all
      
      mail to: user.email, subject: "You have a patient with Confirm Appointment for your Appointment"
    
    end
  

    def cancel_appointment()
      @user = user
      mail to: user.email, subject: "Cancel Appointment"
    end
    
    def reminder_appointment(user, date, sent)

      @user = user
      @time = date
      @sent = sent

      @appointment = Appointment.all

      mail to: user.email, subject: "This is a reminder that you have an appointment in two days. "

    end
    def reminder2_appointment2(user, date, sent)
      @user = user
      @time = date
      @sent = sent
      @appointment = Appointment.all

      mail to: user.email, subject: "This is a reminder that you have an appointment today. "

    end
    
    
    
end
