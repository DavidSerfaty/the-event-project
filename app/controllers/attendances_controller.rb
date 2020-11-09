class AttendancesController < ApplicationController
  before_action :set_attendance, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def create
    if already_attended?
      flash[:notice] = "Tu participes déjà"
    else
      @attendance = Attendance.new(event_id: params[:event_id], guest_id: current_user.id)
      if @attendance.event.owner == current_user
        flash[:notice] = "Tu es administrateur"
      else
        if @attendance.save
          redirect_to @attendance.event
        else
          redirect_to root_path
        end
      end
    end
  end

  def destroy
    @attendance = Attendance.where(event_id: params[:event_id], guest_id: current_user.id).first
    @attendance.destroy
    redirect_to user_path(current_user)
  end

    private

    def already_attended?
      Attendance.where(event_id: params[:event_id], guest_id: current_user.id).exists?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def attendance_params
      params.require(:attendance).permit(:stripe_customer_id)
    end
end
