# module Dungeon
class Dungeons::MonstersController < ApplicationController
  def index
    @dungeon = Dungeon.find(params[:dungeon_id])
    @monsters = @dungeon.monsters
    # require 'pry'; binding.pry
  end
end
# end