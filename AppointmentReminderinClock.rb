@appointment = Appointment.all
@appointment.each do |appointment|
  if appointment.status == "Confirm"
    if (appointment.twodaysreminder == nil)  && (appointment.samedayreminder == nil)
      for i in  0..100 do
          if appointment.users_id == i
            if  ((start_time = Time.zone.parse('12am') + 48.hours) < appointment.date) && ( appointment.date < (end_time = start_time + 24.hours) )
                  appointment.twodaysreminder = "Sent"
                  appointment.save
                  AppointmentMailer.reminder_appointment(User.find(i), appointment, appointment.twodaysreminder).deliver_now
            else
            end
          else
          end

      end
    elsif (appointment.twodaysreminder == "Sent") && (appointment.samedayreminder == nil)
          for i in  0..100 do
            if appointment.users_id == i
              if  ((start_time = Time.zone.parse('12am')) < appointment.date) && ( appointment.date < (end_time = start_time + 24.hour) )
                 appointment.samedayreminder = "Sent"
                 appointment.save
                 AppointmentMailer.reminder2_appointment2(User.find(i), appointment, appointment.samedayreminder ).deliver_now
              end

            else
            end
          end
    end
  else
  end
end
