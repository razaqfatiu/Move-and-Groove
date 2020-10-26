Rails.application.routes.draw do
  get 'site/home'
  get 'activity/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }  # get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activity_records
  resources :activities
  root to: "site#home"
end
