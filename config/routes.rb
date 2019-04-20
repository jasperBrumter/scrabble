Rails.application.routes.draw do
	root to: "pages#play"
  post 'score', to: "pages#score", as: :score
  post "find", to: "pages#find", as: :find
  get "restart", to: "pages#restart", as: :restart
  get "score", to: "pages#play"
  get "find", to: "pages#play"

  post "add", to: "pages#add", as: :addWord

  get "english", to: "english#play", as: :english_play
  post "english/score", to: "english#score", as: :english_score
  post "english/find", to: "english#find", as: :english_find
  get "english/restart", to: "english#restart", as: :english_restart
  get "english/score", to: "english#play"
  get "english/find", to: "english#play"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get "/en/words", to: "english#words"
      get "/en/letters", to: "english#letters"
      get "/en/word", to: "english#result"
      get "/fr/letters", to: "french#lettres"
      get "/fr/words", to: "french#mots"
      get "/fr/word", to: "french#resultat"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
