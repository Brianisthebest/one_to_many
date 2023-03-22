class DungeonsController < ApplicationController
  def index
    @dungeons = Dungeon.all
  end

  def show
    @dungeon = Dungeon.find(params[:id])
  end
end