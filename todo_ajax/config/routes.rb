Rails.application.routes.draw do
  # ts do
  resources :todos
  root 'todos#index'

  # end
end
