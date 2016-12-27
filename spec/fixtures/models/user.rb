class User < DactiveRecord::Base
  validates :id, presence: true
end
