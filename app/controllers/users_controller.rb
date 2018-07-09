class UsersController < Clearance::UsersController

	def new
		@user = User.new
	end

	def create
    @user = user_from_params

	    if @user.save
	      sign_in @user
	     
	      redirect_to user_path(@user)
	    else
	      render template: "users/new"
    	end
	end

	def show
    @user = User.find(params[:id])
  end

	def user_from_params

		email = user_params.delete(:email)
		password = user_params.delete(:password)
		first_name = user_params.delete(:first_name)
		last_name = user_params.delete(:last_name)

		Clearance.configuration.user_model.new(user_params).tap do |user|
			user.email = email
			user.password = password
			user.first_name = first_name
			user.last_name =last_name
		end
	end

	def user_params
		params[Clearance.configuration.user_parameter]|| Hash.new
	end

end
