class GeneratorController < ApplicationController

	def index
		generator = Generator.find(1).json.gsub("=>",":")

		respond_to do |format|
  			format.html # show.html.erb
  			# format.xml  { render :xml => @generator }
  			format.json { render :json => generator }
		end
	end

	def new
	end

	def create
	end

	def show
	end

	def destroy
    end

end
