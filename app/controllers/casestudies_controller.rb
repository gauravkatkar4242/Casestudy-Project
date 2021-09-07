class CasestudiesController < ApplicationController
	load_and_authorize_resource
	before_action :set_casestudy, only: %i[show edit update destroy]

	def index
		# raise @casestudies.inspect
	end

	def new
		@casestudy = Casestudy.new
	end

	def show
		
	end

	def edit
		@traits = Trait.all
		@trait = Trait.new

		session[:fall_back_url] = request.url

	end




	def update
      if @casestudy.update(casestudy_params)
        redirect_to edit_casestudy_path(@casestudy), notice: "Casestudy was successfully Updated."
      else
        render :new, status: :unprocessable_entity 
      end
    
	end


	def create
		@casestudy = Casestudy.new(casestudy_params)
		@casestudy.creator_id = current_user.id
      if @casestudy.save
        redirect_to edit_casestudy_path(@casestudy), notice: "Casestudy was successfully created." 
      else
        render :new, status: :unprocessable_entity 
      end
    
	end



	
	

	private
    def set_casestudy
    	# raise params.inspect
      @casestudy = Casestudy.find(params[:id])
    end

    def casestudy_params
      params.require(:casestudy).permit(:name, :duration, :scale, :passkey)
    end
end
