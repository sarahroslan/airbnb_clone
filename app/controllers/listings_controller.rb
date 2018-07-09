class ListingsController < ApplicationController

	# user can create a listing
	# user can search for listings - have the search load asynchronously as they search
	# user can book listings through a calendar

	def new
		
		@listing = Listing.new

	end

	def create

		@listing = Listing.new(listing_params)
		@listing.user_id = current_user.id
			if @listing.save
			redirect_to listing_path(@listing)
			end
	end

	def show
		@listing = Listing.find(params[:id]) # pass 2 arguments!
	end

	def listing_params

      params.require(:listing).permit(:description, :address, :home_type, :accommodates, :bedroom, :bathroom, :is_kitchen, :is_internet, :price)
	end

	#def update
		#listing = Listing.update(params)
	#end

	
end
