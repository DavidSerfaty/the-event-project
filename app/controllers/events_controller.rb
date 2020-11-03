class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_my_event, only: [:edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(title: params[:title], description: params[:description], start_date: params[:start_date],
      duration: params[:duration], price: params[:price], location: params[:location], owner_id: current_user.id)

    if @event.save
      redirect_to @event, notice: "Gossip créé avec succès"
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path(@event.id), notice:"Ton potin a été mis à jour !"
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end

  def is_my_event
    @event = Event.find(params[:id])
    unless current_user == @event.owner
      redirect_to root_path
    end
  end

end
