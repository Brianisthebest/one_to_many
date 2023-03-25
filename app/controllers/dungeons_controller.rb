class DungeonsController < ApplicationController
  def index
    @dungeons = Dungeon.sort_by_most_recent
  end

  def show
    @dungeon = Dungeon.find(params[:id])
  end

  def new
  end

  def create
    new_dungeon = Dungeon.create(name: params[:name], final_level: params[:final_level], difficulty: params[:difficulty])
    redirect_to "/dungeons"
  end
end