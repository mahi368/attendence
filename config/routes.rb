Rails.application.routes.draw do


  root 'dashboards#index'
  devise_for :users , controllers: { sessions: "sessions" , registrations: "registrations" }
  resources :dashboards
  resources :user_standards
  resources :standards do
    collection do
      post :create_attendence
      post :add_student
      delete :add_student
      get :download_pdf
    end 
  end
end
