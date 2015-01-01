SchoolReview::Application.routes.draw do

  #post '/rate' => 'rater#create', :as => 'rate'
  resources :reviews
  resources :schools

  #this line lets the app implement devise-created ctrls rather than devise ctrls themselves
  devise_for :users, controllers:{sessions:'user/sessions',registrations:'user/registrations',passwords:'user/passwords'}

  resources :engine
  root 'engine#landingPage'
  get 'approve_review'  =>'reviews#approve'
  get 'ban_user'        =>'engine#banUser'
  get 'update_user_role'=>'engine#updateUserRole'
  get 'search_users'    =>'engine#index'
  get 'search_school'   =>'schools#searchSchool'
end
