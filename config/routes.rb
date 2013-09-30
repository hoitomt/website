HoitomtCom::Application.routes.draw do
  get "sessions/new"

  get "session/new"

  root :to => 'main#index'
  match '/main' => 'main#index', :as => 'main'
  match '/about_print' => 'pages#about_pdf', :as => 'about_print'
  match '/about' => 'pages#about', :as => 'about'
  match '/projects' => 'pages#projects', :as => 'projects'
  match '/resume_print' => 'pages#resume_pdf', :as => 'resume_print'
  match '/resume' => 'pages#resume', :as => 'resume'
  resources :contacts
end
