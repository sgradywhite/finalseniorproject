class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  # GET /appointments
  # GET /appointments.json
  def index
    @search = AppointmentSearch.new(params[:search])
    @appointments = @search.scope
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @username_array = User.all.map {|user| [user.firstname, user.lastname, user.id]}
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appointment }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html {redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json {head :no_content }
            if @appointment.update(status_params)

                if @appointment.status == "Confirm"

                    for i in  0..100 do
                        if @appointment.users_id == i
                          AppointmentMailer.confirm_appointment(User.find(i), @appointment.created_at, @appointment.status).deliver_now
                          Event.create(:users_id => @appointment.users_id, :title => "Your have appointment with: " +  @appointment.firstname + " " +  @appointment.lastname, :start => @appointment.date, :end => @appointment.date+30.minutes, :color => "green") 
                        else

                        end

                    end
                    for i in 0..100 do
                      if @appointment.id == i
                            AppointmentMailer.confirm_appointment_for_doctor(User.find_by_firstname(@appointment.firstname), @appointment.created_at, @appointment.status).deliver_now
                      else

                      end


                    end
                elsif @appointment.status == "Pending"
                  for i in  0..100 do
                        if @appointment.users_id == i
                          PatientMailer.make_appointment(User.find(i), @appointment.created_at, @appointment.status).deliver_now

                        else

                        end

                  end

                end


            else

            end

      else
        format.html {render action: 'edit' }
        format.json {render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html {redirect_to appointments_url }
      format.json {head :no_content }
    end
  end


  def update2
  end


   def checkstatus
   end


  def check
   @appointments = Appointment.where(:status => "Pending")
  end

  def appointment
     @appointments = Appointment.where(:status => "")
  end

  def confirmappointment
  end







  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:id, :users_id, :date, :firstname, :lastname, :role, :specialty, :status)
    end

    def status_params
      params.require(:appointment).permit(:status)
    end
end
