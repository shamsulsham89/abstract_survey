ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port  => 587,
  :user_name => "shamsulsham89@gmail.com.",
  :password => "9931993189friendaditi",
  :authentication => 'plain',
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "fathomless-earth-2350.herokuapp.com"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?



