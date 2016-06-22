class InvitesController < ApplicationController
  		def index
	 		@event = Event.where(id: params[:event_id]).first
	 		@invites = @event.invites
	 		# @events = @user.events
	  	end
		def new 
			@invite = Invite.new
			 @event = params[:event_id]  
		end
	  
	   def edit
	  	  @invite =Invite.find(params[:id]) 
	 	end 
	 	def update
		 @invite = Invite.find(params[:id])
		 @invite.update(invite_params) 
		 redirect_to  invite_path @invite
	end 
	  
	  def destroy
	   @invite = Invite.find(params[:id])
	   @invite.destroy
	   flash[:success] = "Invite deleted"
	   redirect_to new_invite_path
	end
	def show
	  	@invite =Invite.find(params[:id])
	  	@event = params[:id] 

	  end 
	 def create
	  	@invite= Invite.new(invite_params)
		# creating a new record in the system 
			if @invite.save
			# saving the records 
				
				redirect_to  event_path(@invite.event)
			
				# redirecting to the show page for guest
			else
				
				redirect_to new_invite_path
		  end
	end 
	
	private 

	def invite_params
		params.require(:invite).permit(:fname, :lname, :event_id, :email, :extra_guest, :dietary_type)
	end 
end
