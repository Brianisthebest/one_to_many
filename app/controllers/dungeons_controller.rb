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
    Dungeon.create(dungeon_params)
    redirect_to "/dungeons"
  end

  def edit
    @edit_dungeon = Dungeon.find(params[:id])
  end

  def update
    dungeon = Dungeon.find(params[:id])
    dungeon.update(dungeon_params)
    redirect_to "/dungeons/#{dungeon.id}"
  end

  def destroy
    dungeon = Dungeon.find(params[:id])
    dungeon.monsters.delete_all
    dungeon.destroy
    redirect_to "/dungeons"
  end

private
  def dungeon_params
    params.permit(:name, :final_level, :difficulty)
  end
end