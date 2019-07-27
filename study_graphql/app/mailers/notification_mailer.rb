# frozen_string_literal: true

# mailer設定の試験用class
# ベースはこの記事を参照
# https://qiita.com/hirotakasasaki/items/ec2ca5c611ed69b5e85e
class NotificationMailer < ApplicationMailer
  default from: '<メールアドレスが入る>'

  def send_confirm_to_self
    mail(
      subject: 'テストメールだよ', # メールのタイトル,
      to: '<メールアドレスが入る>' # 宛先
    ) do |format|
      format.text
    end
  end
end
