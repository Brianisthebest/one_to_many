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
    Dungeon.create(name: params[:name], final_level: params[:final_level], difficulty: params[:difficulty])
    redirect_to "/dungeons"
  end

  def edit
    @edit_dungeon =  @dungeon = Dungeon.find(params[:id])
  end

  def update
    dungeon = Dungeon.find(params[:id])
    dungeon.update(name: params[:name], final_level: params[:final_level], difficulty: params[:difficulty])
    redirect_to "/dungeons/#{dungeon.id}"
  end
end