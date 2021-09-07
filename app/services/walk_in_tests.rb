	
class WalkInTests
	def initialize(params:)
		 @casestudy_id = params[:casestudy_id]
		 @assessor_id = params[:assessor_id]
		 @name = params[:name]
		 @email = params[:email]
		 @passkey = params[:passkey]
		 @params = params
		 
		 
	end
	def try
		a = validate_data()
		return @user if a == "Valid"	
		return a
	end
	
	private

	def validate_data
		return "Invalid Casestudy... Check URL" if !Casestudy.exists?(@casestudy_id)
		# raise @params.inspect
		return "Invalid Passkey" if @passkey != Casestudy.find(@casestudy_id).passkey
			
		if User.find_by(email: @email)
			@user = User.find_by(email: @email)
			return add_casestudy_user()
		end
			
		return add_user()
	end

	def add_user
		@user = User.new(user_params)
		@user.password = "qazqaz"

		return add_casestudy_user() if @user.save
			
		return "Something is worng with User"
		
		
	end

	def add_casestudy_user
		return 'Valid' if @user.casestudy_users.exists?(casestudy_id: @casestudy_id)
		cs = @user.casestudy_users.new(casestudy_users_params)
		return "Valid" if cs.save
			
		return cs.errors.messages
	end

	private
	def user_params
		@params.permit(:name, :email)
	end
	def casestudy_users_params
		@params.permit(:casestudy_id ,:assessor_id)
	end
end
