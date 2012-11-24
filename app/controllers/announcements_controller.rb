class AnnouncementsController < ApplicationController
  def hide
    ids = [params[:id], *cookies.signed[:hidden_announcement_ids]]
    cookies.permanent.signed[:hidden_announcement_ids] = ids

    respond_to do |format|
      format.html do
        request.env['HTTP_REFERER'] ||= products_url
        redirect_to :back
      end
      format.js
    end
  end
end
