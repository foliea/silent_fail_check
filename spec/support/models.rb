class SilentFailLog < ActiveRecord::Base
  validates :message, presence: true
end

class User < ActiveRecord::Base
  validates :name, presence: true
  validates :connection_time, numericality: true

  silent_fail_check :validation, :connection_time
end
