class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :approved]
  before_action :authenticate_user!


  # GET /appointments
  # GET /appointments.json
  def index
    # if current_user
      if current_user.admin? || current_user.staff?
        @appointments = Appointment.all.order("date")
      elsif current_user
        @appointments = current_user.appointments.order("date")
      else 
        redirect_to root_path
      end
    # else
    #   redirect_to root_path
    # end

  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
     if @appointment.user_id == current_user.id
    elsif  current_user.admin? || current_user.staff?

    else
      redirect_to root_path

    end
  end

  def monthly_calendar
    if current_user.staff? || current_user.admin?
      @appointments = Appointment.all.order("date").order("hour")
    else 
      redirect_to appointments_path
    end
  end

  def daily_schedule
    if current_user.staff? || current_user.admin?
      @appointments = Appointment.where("date >= :start_date AND date <= :end_date", {start_date: params[:start_date], end_date: params[:end_date]}).order("date").order("hour")
    else 
      redirect_to appointments_path
    end
  end

  def weekly_calendar
    if current_user.staff? || current_user.admin?
      @appointments = Appointment.all.order("date").order("hour")
    else
      redirect_to appointments_path
    end
  end
  # GET /appointments/new
  def new
    if current_user.guest == true
      @appointment = Appointment.new
    else
      @appointment = Appointment.new :contact_number => current_user.contact_number
    end
  end

  # GET /appointments/1/edit
  def edit
    if @appointment.user_id == current_user.id
    elsif  current_user.admin? || current_user.staff?

    else
      redirect_to root_path

    end
  end



  def approved
    #CarsTodoMailer.ready_for_pickup(@appointment).deliver
    if current_user.admin? || current_user.staff?
      @appointment.update_attribute(:approved, true)
      AppointmentMailer.approved_appointment(@appointment).deliver_now
      redirect_to @appointment, notice: "Appointment has been approved."
    else 
      redirect_to root_path
    end
  end   

  # POST /appointments
  # POST /appointments.json
  def create
  

    
    @appointment = current_user.appointments.build(appointment_params)

    respond_to do |format|
      if @appointment.save
        @appointment.contact_number = current_user.contact_number
        AppointmentMailer.new_appointment(@appointment).deliver_now
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    # if current_user.guest? && @appointment.contact_number.blank?
    #   respond_to do |format|
    #     format.html { render :new, notice: "Guest Users should provide contact Number" }
    #   end
    # end
  
      @appointment.update_attributes(appointment_params)
      respond_to do |format|
        if @appointment.update(appointment_params)
          format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
          format.json { render :show, status: :ok, location: @appointment }
        else
          format.html { render :edit }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
   
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = current_user.appointments.find(params[:id])
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # def save_contact_number
    #     @appointment.contact_number = current_user.contact_number
    # end
    # Never trust parameters from the scary internet, only allow the white list through.
 
    def appointment_params
      params.require(:appointment).permit(:date, :hour, :minute, :user_id, :approved,:current_user ,:contact_number,:category_ids => [])
    end

    # def save_contact_number
    #   @current_user.contact_number = current_user.contact_number
    #   self.contact_number = current_user.contact_number
    # end


end
