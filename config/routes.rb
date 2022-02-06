Rails.application.routes.draw do
  resources :group_categories do
    resources :categories
  end

  resources :questions
  resources :group_questions
  root 'dashboard#index'
  resources :tests


end
