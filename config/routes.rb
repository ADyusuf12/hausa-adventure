Rails.application.routes.draw do
      root "game#show" # The main engine screen

      resource :game, culinary: :singleton, controller: "game", only: [:show] do
        post :choose
      end
end
