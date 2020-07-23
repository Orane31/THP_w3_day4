
class BoardCase
    # initialise chaque instance = une case du tableau, 
    # avec 2 attributs (position, contenu : vide, ou O ou X
        attr_accessor :position, :content
      
        def initialize(position, content)
          @position = position
          @content = content
        end
      end