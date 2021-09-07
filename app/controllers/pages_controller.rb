class PagesController < ApplicationController
	load_and_authorize_resource

	before_action :set_page, only: %i[show edit update destroy]
	before_action :set_casestudy

	def index

	end

	def new
		@page = Page.new
	end

	def show
		
	end

	def edit
		@page = Page.find(params[:id])
	end

	def update
		# raise params.inspect
		@page = @casestudy.pages.find(params[:page][:id])
      if @page.update(page_params)
        redirect_to edit_casestudy_path(@casestudy), notice: "Page was successfully Updated."
      else
				redirect_to edit_casestudy_path(@casestudy), notice: "Something is Wrong"
      end
    
	end



	def create
		@page.casestudy_id = @casestudy.id
			if @page.save
				redirect_to edit_casestudy_path(@casestudy), notice: "Page added successfully." 
			else
				# raise @page.errors.inspect
				redirect_to edit_casestudy_path(@casestudy), notice: "Something is Wrong"
			end
		
	end
	 def destroy
    @page.destroy
    redirect_to edit_casestudy_path(@casestudy), notice: "Page was successfully destroyed." 
  end
	


	
	

	private

		def set_casestudy
	   	@casestudy = Casestudy.find(params[:casestudy_id])
		end
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
    	params.require(:page).permit(:body)
    end
  
end
