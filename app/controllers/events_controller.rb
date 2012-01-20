class EventsController < ApplicationController
	before_filter :find_event, :only => [:show, :edit, :update, :destroy]	

	def index
		@events = Event.page(params[:page]).per(5)
	end

	def show
		@page_title = @event.name
	end

	def new
		@event = Event.new	
	end

	def create
		@event = Event.new(params[:event])
		flash[:notice] = "event was successfully created"
		if @event.save
			redirect_to :action => :index
		else
			render :action => :new
		end
	end

	def edit
	end

	def update
		flash[:notice] = "event was successfully updated"
		if @event.update_attributes(params[:event])
			redirect_to :action => :show, :id =>@event
		else
			render :action =>  :edit
		end
	end

	def destroy
		@event.destroy
		flash[:alert] = "event was successfully deleted"

		redirect_to :action => :index
	end

	protected
	
	def find_event
		@event = Event.find(params[:id])
	end









end
