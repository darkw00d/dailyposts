Rails.application.routes.draw do
  get 'content/view'

  post 'content/view'

  root :to => "content#view"

 match ':controller(/:action(/:id))', :via => [:get, :post]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
