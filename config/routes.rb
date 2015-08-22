SchoolReview::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  resources :posts

  resources :engine
  resources :reviews
  resources :schools
  resources :recipients
  resources :message_boxes

  #this line lets the app implement devise-created ctrls rather than devise(gem) ctrls themselves
  devise_for :users, controllers:{sessions:'user/sessions',registrations:'user/registrations',passwords:'user/passwords',confirmations:'user/confirmations'}

  root 'engine#landingPage'
  get 'landingPage'     => 'engine#landingPage'
  put 'approve_review'  =>'reviews#approve'
  get 'ban_user'        =>'engine#banUser'
  put 'update_user_role'=>'engine#updateUserRole'
  get 'search_users'    =>'engine#index'
  get 'search_school'   =>'schools#searchSchool'
  get 'sent_messagebox' =>'message_boxes#sent'
  get 'trash_messagebox'=>'message_boxes#trash'
  get 'move_to_trash'   =>'message_boxes#moveToTrash'
  get 'developer'       =>'engine#developerPage'
  get 'new_reply_post'  =>'posts#newreplyPost'
  post 'create_reply_post'=>'posts#createReplyPost'
  match '/contact_us'   =>'engine#contactUs', as: :contact_us, via: [:get, :post]
  match '/app_settings' =>'engine#appSettings', as: :app_settings, via: [:get, :post]
  get '/terms', :to=>redirect('/termsToAgree.html')

end
