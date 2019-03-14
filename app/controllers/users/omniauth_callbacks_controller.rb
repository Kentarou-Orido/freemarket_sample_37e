class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_for(:facebook)
  end

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @user = User.find_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: provider.capitalize
      sign_in_and_redirect @user, event: :authentication
    else
      session['devise.#{provider}_data'] = request.env['omniauth.auth'].except(:extra)
      render "devise/registrations/new"
    end
  end

  def failure
    redirect_to root_path and return
  end
end
