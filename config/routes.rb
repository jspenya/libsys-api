Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :create, :update, :show, :destroy] do
        get 'available', on: :collection
      end
      resources :students
      resources :borrowed_books, only: [:index, :create, :update, :show, :destroy] do
      end
      post '/borrowed_books/:id/return_book', to: "borrowed_books#return_book", as: "return_book"
    end
  end

  post 'refresh', controller: :refresh, action: :create
  post 'signin', controller: :signin, action: :create
  post 'signup', controller: :signup, action: :create
  delete 'signin', controller: :signin, action: :destroy
  
end
