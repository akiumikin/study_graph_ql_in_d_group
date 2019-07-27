# frozen_string_literal: true

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: 'smtp.gmail.com',
  domain: 'gmail.com',
  port: 587,
  user_name: '<メールアドレスが入る>',
  password: '<gmailのアプリパスワードが入る>',
  authentication: 'plain',
  enable_starttls_auto: true
}
