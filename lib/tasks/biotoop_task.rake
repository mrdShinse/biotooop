def logger
  Rails.logger
end

namespace :biotoop_task do
  desc 'create biotooop matching group'
  task :matching => :environment do
    event = Event.last


    user_events = UserEvent.where(event_id: event.id)
    if user_events.count === 0
      return puts 'there is no users in the event'
    end

    group = Group.new
    group.attributes = {
        event_id: event.id,
        tag_id: 0
    }
    if group.save
      user_events.each do |user_event|
        user_group = UserGroup.new
        user_group.attributes = {
            group_id: group.id,
            user_id: user_event.user_id
        }
        if user_group.save
          puts "created user_group for  user_id -> #{user_group.user_id}"
        else
          puts group.errors.full_messages
        end
      end
    else
      puts group.errors.full_messages
    end

  end
end
