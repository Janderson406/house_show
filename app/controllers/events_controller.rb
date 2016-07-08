class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
		 if params[:category].blank?
        #for event status :accepted ONLY
      @events = Event.all.order("created_at DESC")
		 else
			 @category_id = Category.find_by(name: params[:category]).id
			 @events = Event.where(category_id: @category_id).order("created_at DESC")
		 end
     @categories = Category.all
     
	end

	def show
    @event = Event.find(params[:id])
	end

	def new
    #if user role :artist or :admin
		@event = Event.new
    @categories = Category.all
	end

	def create
		@event = Event.new(events_params)
		if @event.save
      flash[:notice] = "New event was saved."
			redirect_to @event
		else
      flash.now[:alert] = "There was an error creating your event. Please try again."
			render :new
		end
	end

	def edit
    @event = Event.find(params[:id])
    @categories = Category.all
	end

	def update
    @event = Event.find(params[:id])
		if @event.update(events_params)
      flash[:notice] = "Event listing was updated."
			redirect_to @event
		else
      flash.now[:alert] = "Unable to update your event listing. Please try again."
			render :edit
		end
	end

	def destroy
    @event = Event.find(params[:id])
		@event.destroy
    flash[:notice] = "\"#{@event.title}\" was deleted successfully."
    redirect_to root_path
	end

	private

	def events_params
		params.require(:event).permit(:title, :description, :date, :ticket_link, :status, :user_id, :category_id)
	end
end
