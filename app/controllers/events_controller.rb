class EventsController < ApplicationController
  before_action :require_user, except: :index
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    @future_events = Event.future_events
    @past_events = Event.past_events
  end

  def show
    @invitation = EventAttendance.new
    @event = Event.find(params[:id])
    @uninvited = User.where.not(id: @event.guests)
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)

    respond_to do |format|
      if @event.save
        @event.guests << current_user
        flash[:success] = 'Event was successfully created.'
        format.html { redirect_to @event }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :date)
    end
end
