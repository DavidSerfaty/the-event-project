class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :is_accepted, :is_my_event]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :is_my_event, only: [:edit, :update, :destroy]
  before_action :is_accepted, only: [:show]

  def index
    @events = Event.accepted.all
  end

  def show

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(title: params[:title], description: params[:description], start_date: params[:start_date],
      duration: params[:duration], price: params[:price], location: params[:location], owner_id: current_user.id)
    @event.cover.attach(params[:cover])
    if @event.save
      redirect_to event_path(@event.id), notice: "événement créé avec succès"
    else
      @event.errors.messages
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event.id), notice:"événement a été mis à jour !"
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
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location, :cover, :status)
  end

  def is_my_event
    unless current_user == @event.owner
      redirect_to root_path
    end
  end

  def is_accepted
    unless @event.accepted?
      flash[:alert] = "événement en attente de validation"
      redirect_to user_path(current_user)
    end
  end

end
