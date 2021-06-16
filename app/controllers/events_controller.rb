class EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
        @events=Event.all
    end

    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(event_params)

        if @event.save
            redirect_to event_path(@event[:id])
        else
            render :new
        end
    end

    def show 
        @event = Event.find(params[:id])
    end

    private

    def event_params
        params.require(:event).permit(:title,:details,:event_date)
    end

end
