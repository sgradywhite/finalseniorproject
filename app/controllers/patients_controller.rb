class PatientsController < ApplicationController
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]


    def edit
    end

    def update
    end

    def show
      
    end

    def destory
    end



    def appointment
        @allergys = Appointment.where(:specialty => "Allergy")
        @backproblems = Appointment.where(:specialty => "BackProblems")

        @user_options = Appointment.order(:specialty).distinct.pluck(:specialty)
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

end
