class EventsController < ApplicationController
before_action :require_admin, only: [ :unverifiedevents, :adminverifyevent, :adminupdateevent ]


def index
@events = Event.where(event_verified: true).where("event_date >= ?",Time.new.strftime("%m/%d/%Y"))
end

def new
@event = Event.new
end


def show
@event = Event.find(params[:id])
end



def create
@event = Event.new(event_params)
@event.user_id = current_user.id if user_signed_in? 
if @event.save
flash[:notice] = "You successfully submitted an event. Your event will be published once its verified by the website"
redirect_to root_path
else
render 'new'
end
end



def unverifiedevents

@events = Event.where(event_verified: true).where("event_date >= ?",Time.new.strftime("%m/%d/%Y"))
end



def adminverifyevent


@event = Event.find(params[:id])

end



def adminupdateevent
@event = Event.find(params[:id])
@event.toggle(:event_verified)
if @event.update(event_params2)
flash[:notice] = "You Verified " + @event.event_name
redirect_to unverifiedevents_path
else
render 'adminverifyevent'
end




end








private
def event_params
params.require(:event).permit(:event_name,:event_date,:event_time,:proof,:category_id,:add_info)
end


def event_params2
params.require(:event).permit(:location, :long, :lang, :gmaps_link)
end



def require_admin
   if !user_signed_in? || (user_signed_in? && !current_user.admin?)
   flash[:notice] = "Only admin users have this privelege"
   redirect_to root_path
   end
   end


end
