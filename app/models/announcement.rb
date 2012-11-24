class Announcement < ActiveRecord::Base
  attr_accessible :ends_at, :message, :starts_at

  validates :message, presence: true
  validates :starts_at, presence: true
  validates :ends_at, presence: true

  scope :current, -> { where("starts_at <= :now and ends_at >= :now", now: Time.zone.now )  }
end