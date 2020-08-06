class EventAttendancesController < ApplicationController

    def create
        invitation = EventAttendance.new(eventattendances_params)
        invited = invitation.attende
        event = invitation.attendances

        if invitation.save
            flash[:success] = "#{invited}'s invited succssfully"
        else
            flash[:danger] = "#{invited}'s end #{event} invitation failed"
        end
        redirect_to events_path
    end

    private

    def eventattendances_params
        params.require(:invitation).permit(:attende_id, :attendances_id)
    end


end