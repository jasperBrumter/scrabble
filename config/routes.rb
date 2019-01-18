Rails.application.routes.draw do
	root to: "pages#play"
  post 'score', to: "pages#score", as: :score
  post "find", to: "pages#find", as: :find
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
