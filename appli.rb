
require 'bundler'
Bundler.require


require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/boardcase'

# Tout simplement on démarre le jeu

Game.new.perform