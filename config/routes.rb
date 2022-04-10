Rails.application.routes.draw do
  get '/books' => 'books#new'
  get '/books' => 'books#index'
  get '/books/show' => 'books#show'
  get '/books/edit' => 'books#edit'
  get '/top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
