module AnnouncementsHelper

  def hidden_announcements
    cookies.signed[:hidden_announcement_ids]
  end
end
