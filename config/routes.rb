Rails.application.routes.draw do
  devise_for :users
  
  root to: 'search#index'

  get "/allie"    => 'search#grab_allie'
  get "/cdw"      => 'search#grab_cdw' 
  get "/milestek" => 'search#grab_milestek'
  get "/peerless" => 'search#grab_peerless'

end
