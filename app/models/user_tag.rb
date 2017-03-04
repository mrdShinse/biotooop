class UserTag < ApplicationRecord
  def self.already_registered(user_id, tag_id)
    UserTag.find_by(user_id: user_id, tag_id: tag_id).present?
  end
end
