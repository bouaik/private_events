module ApplicationHelper
  def header
    if current_user
      render 'layouts/logged_in'
    else
      render 'layouts/logged_out'
    end
  end
end
