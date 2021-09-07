class TraitsController < ApplicationController
	load_and_authorize_resource	

	before_action :set_trait, only: %i[show edit update destroy]

	def index
		@traits = Trait.all
	end

	def new
		@trait = Trait.new
	end

	def show
		
	end

	def edit
		@trait = Trait.find(params[:id])
	end

	def update
		# raise params.inspect
		@trait = Trait.find(params[:id])
      if @trait.update(trait_params)
        redirect_to traits_path, notice: "Trait was successfully Updated."
      else
				redirect_to traits_path, notice: "Something is Wrong"
      end
   	end



	def create
		@trait = Trait.new(trait_params)
			if @trait.save
				redirect_to traits_path, notice: "Trait added successfully." 
			else
				redirect_to traits_path, notice: "Something is Wrong"
			end
		
	end

	def destroy
    @trait.destroy
    redirect_to traits_path, notice: "Trait was successfully destroyed." 
  end
	


	
	

	private

		def set_trait
			raise params
	   	@trait = Trait.find(params[:id])
		end

    def trait_params
    	params.require(:trait).permit(:name)
    end
  
end
