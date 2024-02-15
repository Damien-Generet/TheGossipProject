class CitiesController < ApplicationController
  def show
    @city = City.find(params[:id])

    # trouver les gossips de la ville =>
    gossips = Gossip.all # on récupère tous les gossips existants
    @gossips_from_city = [] # on initialise notre liste vide 
    gossips.each do |gossip| # boucle for pour itérer sur les gossips
      if gossip.user.city == @city # on vérifie que le gossip appartient a notre ville
        @gossips_from_city << gossip # et on stock le gossip avant de tout renvoyer
      end
    end
  end
end
