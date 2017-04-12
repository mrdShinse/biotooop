require 'date'

namespace :event_task do
  desc "create this weekend's event"
  task :create  => :environment do
    event = Event.new
    event.attributes = {
        date: Date.today,
        type: 1,
        area: '豊洲',
        meeting_time: '１２時',
        meeting_place: 'ローソン前',
        num_users: 0
    }
    if event.save
      users = User.all
      users.each do |user|
        EventMailer.send(user, event).deliver_now
      end
      puts 'event created'
    else
      puts event.errors.full_messages
    end

  end
end
