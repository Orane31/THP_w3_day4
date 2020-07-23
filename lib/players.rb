class Player
    # sert à initialiser les players avec deux attributs (nom, et symbole X ou O.
        attr_accessor :name, :symbol
      
        def initialize (name, symbol)
          @name = name
          @symbol = symbol
        end
      
      end