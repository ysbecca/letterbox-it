Clearance.configure do |config|
  config.routes = false
	# TODO set this to the admin account for app on production
  	config.mailer_sender = "ysbecca@gmail.com"
  	config.user_model = User
end
