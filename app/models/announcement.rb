class Announcement < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at

  validates :message, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  def self.current hidden_announcements_ids = nil
    result = where("starts_at <= :now and ends_at >= :now", now: Time.zone.now )
    if hidden_announcements_ids.present?
      result = result.where("id not in (?)", hidden_announcements_ids)
    end
    result
  end
end
