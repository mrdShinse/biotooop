class EventMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.event_mailer.send.subject
  #
  def sender(user, event)
    @user = user
    @event = event
    mail to: @user.email, subject: 'ビオトープイベント開催のお知らせ'

    # mail to: "to@example.org"
  end
end
