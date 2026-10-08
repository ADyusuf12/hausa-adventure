Rails.application.routes.draw do
      root "game#show" # The main engine screen
      post "game/restart", to: "game#restart", as: :restart_game

      resource :game, culinary: :singleton, controller: "game", only: [ :show ] do
        post :choose
        post :resolve_roll
      end
end
