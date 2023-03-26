# module Dungeon
class Dungeons::MonstersController < ApplicationController
  def index
    @dungeon = Dungeon.find(params[:dungeon_id])
    @monsters = @dungeon.monsters
  end

  def new
    @dungeon = Dungeon.find(params[:dungeon_id])
  end

  def create
    @dungeon = Dungeon.find(params[:dungeon_id])
    @dungeon.monsters.create!(name: params[:name], boss: params[:boss], health: params[:health])
    redirect_to "/dungeons/#{@dungeon.id}/monsters"
  end
end
# end