class AnnoncesController < ApplicationController
	def new
		@annonce = Annonce.new
		@villes = CodesPostauxEtCommune.all
	end

	def create
		@annonce = Annonce.new(annonce_params)
		@villes = CodesPostauxEtCommune.all
		if @annonce.save
			flash[:notice] = "Votre annonce a été déposée. Merci."
			redirect_to @annonce
  		else
    		render 'new'
  		end
  	end	

	def index
		@annonces = Annonce.last(3).reverse
	end

	def show
	    @annonce = Annonce.find(params[:id])
 	end	

 	def result		
 		@annonces = Annonce.search(params[:search], params[:code_postal])
		@autres_categories = Annonce.search_other(params[:search], params[:code_postal])
 	end

	private
	  def annonce_params
	    params.require(:annonce).permit(:categorie,:titre,:code_postal,:adresse,:dispo,:quantite,:commentaire, :img, :don)
	  end	
end
