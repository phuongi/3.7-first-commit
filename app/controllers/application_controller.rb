class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
end

ActionMailer::Base.mail(:from => 'from@domain.com', :to => 'to@domain.com', :subject => "Welcome to My Awesome Site", :body => 'I am the email body.').deliver_now