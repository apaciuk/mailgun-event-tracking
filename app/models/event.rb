class Event < ApplicationRecord
    enum track_status: {
    unsubscribed: 0,
    accepted: 1,
    delivered: 2,
    clicked: 3,
    opened: 4,
    rejected: 5,
    failed: 6,
    complained: 7,
    stored: 8
  }
end
