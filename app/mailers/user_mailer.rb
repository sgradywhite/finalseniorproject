class UserMailer < ApplicationMailer

    def account_activation(user)
        @user = user
        mail to: user.email, subject: "Account Created Status"
    end
    
    def event_confirmation(evid, user)
        @eventid = evid
        @user = user
        
         mail to: user.email, subject: "Event Notification"
    end    

    def password_reset(user)
        @user = user
        mail to: user.email, subject: "Password reset"
    end

    

end
