class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    helper_method :mailbox, :conversation

    private

    def mailbox
      @mailbox ||= current_user.mailbox
    end

    def conversation
      @conversation ||= mailbox.conversations.find(params[:id])
    end

    # Confirms a logged-in user.
    def logged_in_user
        unless logged_in?
            store_location
            flash[:danger] = "Please log in."
            redirect_to login_url
        end
    end

end
