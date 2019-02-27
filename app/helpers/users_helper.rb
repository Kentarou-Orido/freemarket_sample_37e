module UsersHelper
  def confirming_login_for_head_bar

    if user_signed_in?
      render "default/default-header-login"
    else
      render "default/default-header-not-login"
    end
  end
end
