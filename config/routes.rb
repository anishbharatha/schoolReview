SchoolReview::Application.routes.draw do

  resources :reviews
  resources :schools
  resources :recipients
  resources :message_boxes

  #this line lets the app implement devise-created ctrls rather than devise(gem) ctrls themselves
  devise_for :users, controllers:{sessions:'user/sessions',registrations:'user/registrations',passwords:'user/passwords',confirmations:'user/confirmations'}

  resources :engine
  root 'engine#landingPage'
  get 'approve_review'  =>'reviews#approve'
  get 'ban_user'        =>'engine#banUser'
  get 'update_user_role'=>'engine#updateUserRole'
  get 'search_users'    =>'engine#index'
  get 'search_school'   =>'schools#searchSchool'
  get 'sent_messagebox' =>'message_boxes#sent'
  get 'trash_messagebox'=>'message_boxes#trash'
  get 'move_to_trash'   =>'message_boxes#moveToTrash'
end
