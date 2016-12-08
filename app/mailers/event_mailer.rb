class EventMailer < ApplicationMailer

  def reminder_event(user, startdate, enddate, sent)

    @user = user
    @start = startdate
    @end = enddate
    @sent = sent

    @EventReminder = EventReminder.all

    mail to: user.email, subject: "This is a reminder that you have an event in two days. "

  end
end
