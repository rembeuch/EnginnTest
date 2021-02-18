Rails.application.routes.draw do
  root to: 'contacts#index'
  resources :contacts do
    post 'tag' => 'contacts#tag'
    resources :tags, only:[:new, :create]
  end

  post 'pages10' => 'contacts#pages10'
  post 'pages20' => 'contacts#pages20'
  post 'pages50' => 'contacts#pages50'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
