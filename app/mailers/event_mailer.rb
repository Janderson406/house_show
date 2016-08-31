class EventMailer < ApplicationMailer
  default from: "houseshowevents@gmail.com"

  def new_event(user, event, profile)

    @user = user
    @event = event
    @profile = profile

    mail(to: user.email, subject: "New event request from #{user}")
  end
end
