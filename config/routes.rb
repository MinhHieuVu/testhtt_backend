Rails.application.routes.draw do
  resources :questions
  resources :group_questions
  root 'dashboard#index'
  resources :tests


end
