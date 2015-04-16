ActionMailer::Base.smtp_settings = {
  address:"smtp.mandrillapp.com",
  port: 587,
  enable_starttls_auto: true,
  user_name: "jy.johnlee@gmail.com",
  password: "ImhKwo4a5CwoYyy-6F9d6g",
  authentication: "login"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"
