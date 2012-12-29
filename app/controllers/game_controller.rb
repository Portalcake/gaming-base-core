class GameController < ApplicationController

  before_filter :load_game

  def load_game
    unless @game = ::Game.find_by_token(@@game_id)
      respond_to do |format|
        format.html {
          redirect_to root_url,
            :alert => 'Game not supported.',
            :status => :not_found
        }
        format.json { head :not_found }
      end
      return false
    end
    unless @game.published?
      render 'share/game_unpublished', :layout => 'application'
    end
    if @game.maintenance?
      render "share/game_maintenance", :layout => 'application'
    end
  end

  def self.game_id(game_id)
    @@game_id = game_id
  end
end