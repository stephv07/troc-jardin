#----------------------------------------------------------------------------------
# Creation d'un objet "AnnoncesController" qui effectue les aiguillages entre
# les traitements a appliquer a l'objet "Annonce" dont la classe est defini dans
# model/annonce.rb
#----------------------------------------------------------------------------------
class AnnoncesController < ApplicationController


	#------------------------------------------------------------------------------
	# La methode "create" permet de creer un nouvelle objet "Annonce"
	#------------------------------------------------------------------------------
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
  	#------------------------------------------------------------------------------	


  	#------------------------------------------------------------------------------
	# La methode "index" permet d'afficher les trois dernières annonces
	#------------------------------------------------------------------------------
	def index
		@annonces = Annonce.last(3)#.reverse
	end
	#------------------------------------------------------------------------------


  	#------------------------------------------------------------------------------
	# La methode "show" permet d'afficher le détail de l'annonce selectionne
	#------------------------------------------------------------------------------
	def show
	    @annonce = Annonce.find(params[:id])
 	end	
 	#------------------------------------------------------------------------------


  	#------------------------------------------------------------------------------
	# La methode "result" permet d'afficher les annonces suivant les filtres selectionnes
	#------------------------------------------------------------------------------
 	def result		
 		@annonces = Annonce.search(params[:search], params[:code_postal])
		@autres_categories = Annonce.search_other(params[:search], params[:code_postal])
 	end
 	#------------------------------------------------------------------------------


	private
	  def annonce_params
	    params.require(:annonce).permit(:categorie,:titre,:code_postal,:adresse,:dispo,:quantite,:commentaire, :img, :don)
	  end	
end
