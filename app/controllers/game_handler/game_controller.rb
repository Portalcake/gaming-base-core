module GameHandler
  class GameController < ApplicationController
    before_filter :load_game

    def load_game
      return unless game_id
      unless @game = ::Game.find_by_token(game_id)
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
        render 'share/game_unpublished', :layout => false
      end
      if @game.maintenance?
        render "share/game_maintenance", :layout => false
      end
    end

    def game_id
      nil #need to be overridden
    end
  end
end