Rails.application.routes.draw do

  get("/", { :controller => "calc", :action => "home"})
  
  get("/flexible/square/:the_num", { :controller => "calc", :action => "flex_square"})
  
  get("/flexible/square_root/:the_num", { :controller => "calc", :action => "flex_square_root"})  
  
  get("/flexible/payment/:bps/:years/:pv", { :controller => "calc", :action => "flex_payment"})
  
  get("/flexible/random/:min/:max", { :controller => "calc", :action => "flex_random"})
  
  get("/square/new", { :controller => "calc", :action => "square_form_input"})
  get("/square/results", { :controller => "calc", :action => "square_form_results"})
  
  get("/square_root/new", { :controller => "calc", :action => "sqrt_form_input"})
  get("/square_root/results", { :controller => "calc", :action => "sqrt_form_results"})
  
  get("/payment/new", { :controller => "calc", :action => "payment_inputs"})
  get("/payment/results", { :controller => "calc", :action => "payment_results"})
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
