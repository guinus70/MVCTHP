$:.unshift File.expand_path("./../lib", __FILE__)
require 'gossip'
require 'view'

class Controller
  
  def initialize
    @view = View.new
  end
  
  def create_gossip
    params = @view.create_gossip
    my_gossip = Gossip.new(params[:author], params[:content]) #=> Crée une instance de potin, sauvergardée juste dans cette variable
    my_gossip.save #=> Sauvegarde l'instance de potin dans le CSV correspondant, en créant une nouvelle ligne dans mon fichier CSV
  end

  def index_gossips
    all_gossips = Gossip.all
    @view.index_gossips(all_gossips)
    return all_gossips.length
  end

  def delete_gossip()
    number_of_gossips = self.index_gossips
    number_gossip = @view.delete_gossips(number_of_gossips)
    Gossip.delete(number_gossip)
   
end
end