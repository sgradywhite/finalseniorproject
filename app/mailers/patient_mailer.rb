class PatientMailer < ApplicationMailer
    
    def make_appointment(user, createdtime, stats)
      @user = user
      @time = createdtime
      @status = stats
      @appointment = Appointment.all
     
      
          
           mail to: user.email, subject: "Made Appointment "
          
    end  
    
    
end    
