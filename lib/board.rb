
class Board
    # Le tableau board a 9 cases qui correspondent aux 9 instances de BoardCase
    =begin 
    
    Méthodes : le Board va s'occuper de faire le lien entre les BoardCases et le Game : il change les valeurs des BoardCases (de " " à "x" ou "o") et vérifie en fonction de la combinaison des BoardCases si la partie est finie (= un joueur a gagné ou bien les 9 cases sont remplies sans vainqueur).
    =end
        attr_accessor :board, :row_complete
      
        def initialize
    # L'initialisation du tableau crée les 9 instances de BoardCase
          @A1 = BoardCase.new("A1", " ")
          @A2 = BoardCase.new("A2", " ")
          @A3 = BoardCase.new("A3", " ")
          @B1 = BoardCase.new("B1", " ")
          @B2 = BoardCase.new("B2", " ")
          @B3 = BoardCase.new("B3", " ")
          @C1 = BoardCase.new("C1", " ")
          @C2 = BoardCase.new("C2", " ")
          @C3 = BoardCase.new("C3", " ")
          @row_complete = false
    
    # En même temps on crée deux arrays : les cases elle-mêmes : A1, A2, A3 etc, et leurs positions "A1", "A2" etc
          @board =[@A1,@A2,@A3,@B1,@B2,@B3,@C1,@C2,@C3]
          @positions = ["A1","A2","A3","B1","B2","B3","C1","C2","C3"]
        end
      
    # on demande au joueur dont c'est le tour où il souhaite jouer 
    # On vérifie que la case choisie par le player existe bien et n'est pas occupée
        def play_turn (player)
            puts "#{player.name}, it's your turn. Pick a cell :"
            @symbol = player.symbol
            position = gets.chomp.to_s.upcase
        
            if @positions.include?(position) == false
              puts "Please choose a cell that exists"
              position = gets.chomp.to_s.upcase
            end
            @positions.delete(position)
            @board.map do |cell|
              if cell.position == position
                cell.content = @symbol
              end
            end
            show
            status
            if @row_complete == true
              print "#{player.name}, you have filled three #{player.symbol} in a row, you win !!! "
        
                elsif @positions.size == 0
              puts "Ex-aequo !"
              @row_complete = true
            end
        end
    
        # Liste des "winning combinations" a1, a2, a3, a1, b1, c1, etc;
        # Quand un player a aligné ses 3 symboles, il gagne la partie
        def status
      
          if (@A1.content == @A2.content && @A1.content == @A3.content) && @A1.content != " "
            @row_complete = true
          end
      
          if (@B1.content == @B2.content && @B1.content == @B3.content) && @B1.content != " "
            @row_complete = true
          end
      
          if (@C1.content == @C2.content && @C1.content == @C3.content) && @C1.content != " "
            @row_complete = true
          end
      
          if (@A1.content == @B1.content && @A1.content == @C1.content) && @A1.content != " "
            @row_complete = true
          end
      
          if (@A2.content == @B2.content && @A2.content == @C2.content) && @A2.content != " "
            @row_complete = true
          end
      
          if (@A3.content == @B3.content && @A3.content == @C3.content) && @A3.content != " "
            @row_complete = true
          end
      
          if (@A1.content == @B2.content && @A1.content == @C3.content) && @A1.content != " "
            @row_complete = true
          end
      
          if (@A3.content == @B2.content && @A3.content == @C1.content) && @A3.content != " "
            @row_complete = true
          end
        end
      
        # Show empty board at initialization and get variable at each player turn
        def show
    
            puts ""
            puts " "*36 + "1     2    3"
            puts " "*33 + "A  #{@A1.content}  |  #{@A2.content}  |  #{@A3.content} "
            puts " "*36 + "-------------"
            puts " "*33 + "B  #{@B1.content}  |  #{@B2.content}  |  #{@B3.content} "
            puts " "*36 + "-------------"
            puts " "*33 + "C  #{@C1.content}  |  #{@C2.content}  |  #{@C3.content} "
            puts ""
            end
      end