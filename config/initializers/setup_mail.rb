ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port  => 587,
  :domain  => 'heroku.com',
  :user_name => "abstractsurvey@gmail.com.",
  :password => "",
  :authentication => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "fathomless-earth-2350.herokuapp.com"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?



