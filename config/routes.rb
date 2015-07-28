Rails.application.routes.draw do
  devise_for :users
  
  root to: 'search#index'

  get "/answer"    => 'search#grab'
  # get "/cdw"      => 'search#grab_cdw' 
  # get "/milestek" => 'search#grab_milestek'
  # get "/peerless" => 'search#grab_peerless'

end
