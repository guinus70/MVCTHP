


class Gossip
  attr_reader :author , :content

  def initialize(author, content)
    @content = content
    @author = author
  end

  def save
    CSV.open("./db/gossip.csv",'a') { |f|
      f << [@author,@content]
    }
  end 

  def self.all
    # 1)création d'un array vide qui s'appelle all_gossips
      all_gossips =  []
    # 2)chaque ligne de ton CSV.each do |ligne|
      # 2-a) gossip_provisoire = Gossip.new(paramètres de la ligne) - permet de créer un objet gossip
      # 2-b) all_gossips << gossip_provisoire - permet de rajouter le gossip provisoire au array
    # end
    CSV.foreach("./db/gossip.csv") { |row|
      #binding.pry
      all_gossips << Gossip.new(row[0], row[1])
    }
    # 3)return all_gossips - on renvoie le résultat
    return all_gossips
  end


  def self.delete(number_gossip)

  csv_gossip = CSV.read("db/gossip.csv")
  csv_gossip.delete_at(number_gossip - 1)
      
    CSV.open("db/gossip.csv", 'w') do |f|
      csv_gossip.each do |i|
          f << i
      end
    end
  end
end
