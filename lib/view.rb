class View
  
  def create_gossip
    puts "Qui est l'auteur ?"
    author = gets.chomp
    puts "Quel est le contenu ?"
    content = gets.chomp
    return params = {content: content, author: author}
  end

  def index_gossips(all_gossips)
    all_gossips.each do |x|
      puts "#{x.author}, #{x.content}\n\n"
    end
  end

  def delete_gossips(number_of_gossips)

    number_gossip = 0
  
    while number_gossip < 1 || number_gossip > number_of_gossips 
      puts "Quelle ligne veux tu supprimer ?"
      print "> "
      number_gossip = gets.chomp.to_i

    
    end

    return number_gossip
  end
end