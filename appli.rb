
require 'bundler'
Bundler.require


require_relative 'lib/game_'
require_relative 'lib/players'
require_relative 'lib/board'
require_relative 'lib/board_case'

# Tout simplement on démarre le jeu

Game.new.perform