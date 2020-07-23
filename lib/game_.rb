class Game

    attr_accessor :players, :board , :player, :count_turn
#créé 2 joueurs, créé un board, met le status à "on going", défini un current_player  

    def initialize
        @players = Array.new
        @board = Board.new
        @count_turn = 0
        puts "Who wants to play with the X ? Type your name please :"
        print "--> "
        @players << Player.new(gets.chomp.to_s, "O")
    
        puts "Who wants to play with the O ? Type your name please :"
        print "--> "
        @players << Player.new(gets.chomp.to_s, "X")
    end
  


    
    # Au début de chaque tour de jeu, le programme affiche dans le terminal le plateau de jeu.
    def current_player
      until @board.row_complete == true
        @count_turn +=1 
    # count_turn affiche le nombre de round, +1 à chaque fois que les deux players ont joué
        3.times do puts ""
        end
        puts "-" * 40 +" ROUND #{@count_turn} " + "-" * 40
        @board.show 
        
        @players.each do |i| 
          if @board.row_complete == false
            @board.play_turn(i) # on demande au joueur dont c'est le tour où il souhaite jouer 

          else
            one_more_round
          end
        end
      end
    end

    # À la fin d'une partie, on propose de lancer une nouvelle partie
    def one_more_round
      if @board.row_complete == true 
        puts "To start a new game, type 'A'"
        response = gets.chomp.to_s.upcase
        if response == "A"
          Game.new.perform
        else
          exit
        end
      end
    end

    def perform
# Ici on affiche un styling, on souhaite welcome aux deux joueurs et on lance le perfom qui appelle toutes les méthodes dans l'ordre
        puts "

                                                                                                       
        _|_|_|_|_|  _|_|_|    _|_|_|      _|_|_|_|_|    _|_|      _|_|_|      _|_|_|_|_|    _|_|    _|_|_|_|  
            _|        _|    _|                _|      _|    _|  _|                _|      _|    _|  _|        
            _|        _|    _|                _|      _|_|_|_|  _|                _|      _|    _|  _|_|_|    
            _|        _|    _|                _|      _|    _|  _|                _|      _|    _|  _|        
            _|      _|_|_|    _|_|_|          _|      _|    _|    _|_|_|          _|        _|_|    _|_|_|_|  
                                                                                                              
                                                                                                              
       
       "
        puts "Hello #{@players[0].name} and #{@players[0].symbol}, and welcome to MORPIO. Here's your empty board... May the best player win !"
        current_player
    end
    

  end