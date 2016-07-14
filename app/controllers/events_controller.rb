class EventsController < ApplicationController
 def index
		@events = Event.all
	end
	def edit 
		@event = Event.find(params[:id])
	end 

	def new
	  	@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		# creating a new record in the system 
		if @event.save
			# saving the records 
			flash[:notice] = "Yeah lets create this party ."
			redirect_to  event_path @event
			# redirecting to the show page for this event
		else
			flash[:alert] = "There was a problem lets try again"
			redirect_to new_event_path
		end
	end 
	
	def show
	    @event = Event.find(params[:id])
	    @invite = Invite.new
	     # able to render new invite form and save 
	    @product = Product.new
	     # able to render new product form and save 
	    # flash message for 
	    @total = total(@event)
	    @wallet = wallet(@event)
	    date_now = Date.today  
	    invite = (@event.invites.count)
	    flash[:alert] = " You have #{invite}  guest  on your list"
		days = (@event.date - date_now).to_i  
		# count downs the event days 
		flash[:notice] = " You have #{days} days to plan this party"
	end

	
	def total(event) 
		total_cost = 0
		event.products.each do |product|
		# loops through the products created on the show events page **********
		total_cost += product.price * product.quantity
		# the total cost calculations 
		end
		total_cost
	end 
    def update
    	@event = Event.find(params[:id])
 		@event.update(event_params) 
 		redirect_to event_path @event
    end 

	def wallet(event)
		remaining_budget = event.budget
		# remaining_budget is now the current budget for this event *************
		event.products.each do |product|
		# loops through the items created on the show events 
		remaining_budget -= product.price * product.quantity
		# price * quantity - reamining budget which is the current budget that was set in the beginning 
		end
 		remaining_budget
	end
	
	
	def destroy
	  Event.find(params[:id]).destroy
	  flash[:success] = "Event deleted"
		redirect_to  new_event_path @event
	end
		 
	private
	# thinking of this similiar to the the post controller which is why  i merged the user_id and current_user so it can 
	# print out the user_id and connects 
	def event_params
		 params.require(:event).permit(:user_id,:party_type,:name ,:adress,:date,:budget,:product_id,:invite_id).merge(user: current_user)
	end 

end
