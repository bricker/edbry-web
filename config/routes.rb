EdbryWeb::Application.routes.draw do
  resources :blog, controller: "posts", as: "posts" # this makes the "blog" paths *only* external. All internal paths and references are to "posts".
  resources :portfolio, controller: "projects", as: "projects" # same as above
  resources :users
  resources :password_resets, only: [:new, :edit, :update, :create], path_names: { new: "forgot_password", edit: "reset_password" }
  
  resources :sessions, only: [:new, :create, :destroy]
  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'
  
  resources :pages
  get ':id' => "pages#show", as: 'view_page' # This needs to be last
  
  root to: 'pages#index'
end
