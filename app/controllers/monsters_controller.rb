class MonstersController < ApplicationController
  def index
    @monsters = Monster.only_true
    # @monsters_true = @monsters
  end

  def show
    @monster = Monster.find(params[:id])
  end

  def edit
    @monster = Monster.find(params[:id])
  end

  def update
    monster = Monster.find(params[:id])
    monster.update(name: params[:name], boss: params[:boss], health: params[:health])
    redirect_to "/monsters/#{monster.id}"
  end
end