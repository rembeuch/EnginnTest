Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts do
    post 'tag' => 'contacts#tag'
  end

  post 'pages20' => 'contacts#pages20'
  get 'pages50' => 'contacts#pages50'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
