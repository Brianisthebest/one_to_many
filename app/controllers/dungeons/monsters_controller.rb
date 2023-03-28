# module Dungeons
class Dungeons::MonstersController < ApplicationController
  def index
    @dungeon = Dungeon.find(params[:dungeon_id])
    @monsters = @dungeon.sort_by(params)
  end

  def new
    @dungeon = Dungeon.find(params[:dungeon_id])
  end

  def create
    @dungeon = Dungeon.find(params[:dungeon_id])
    @dungeon.monsters.create!(name: params[:name], boss: params[:boss], health: params[:health])
    redirect_to "/dungeons/#{@dungeon.id}/monsters"
  end

  def show
    @dungeon = Dungeon.find(params[:dungeon_id])
    @dungeon.select_with_length(params)
    redirect_to "/dungeons/#{@dungeon.id}/monsters"
  end
end
# end