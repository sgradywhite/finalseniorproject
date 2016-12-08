require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork

  handler do |job|
    puts "Running #{job}"
  end

every(30.seconds, 'Creating Cycle') {

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
@eventreminder = EventReminder.all
@eventreminder.each do |eventreminder|
  if (eventreminder.twodaysreminder == nil)  && (eventreminder.samedayreminder == nil)
    for i in  0..100 do
        if eventreminder.users_id == i
            if  ((start_time = Time.zone.parse('12am') + 48.hours) < eventreminder.start) && ( eventreminder.start < (end_time = start_time + 24.hours) )
                eventreminder.twodaysreminder = "Sent"
                eventreminder.save
                EventMailer.reminder_event(User.find(i), eventreminder.start, eventreminder.end, eventreminder.twodaysreminder).deliver_now
            else
            end
         else
         end
    end
  elsif (eventreminder.twodaysreminder == "Sent") && (eventreminder.samedayreminder == nil)
        for i in  0..100 do
          if eventreminder.users_id == i
                if  ((start_time = Time.zone.parse('12am')) < eventreminder.start) && ( eventreminder.start < (end_time = start_time + 24.hour) )
                   eventreminder.samedayreminder = "Sent"
                   eventreminder.save
                   EventMailer.reminder2_event2(User.find(i), eventreminder.start, eventreminder.end, eventreminder.samedayreminder ).deliver_now
                else
                end
            else
            end
        end
  end
end



}


end
