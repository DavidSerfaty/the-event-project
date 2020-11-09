class CoversController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    @event.cover.attach(params[:cover])
    redirect_to(event_path(@event))
  end
end
