class Person < ActiveRecord::Base
  has_attached_file :avatar, :styles => {:thumbnail => "75x75#"}
end

