class Listing < ApplicationRecord

	belongs_to :user

  	self.per_page = 5
	
	
end
