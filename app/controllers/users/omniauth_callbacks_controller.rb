class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github 
    omniauth_action(request.env['omniauth.auth'], 'Github')   
  end

  protected
  def omniauth_action(oauth, provider)
    authentication = Authentication.where(provider: oauth['provider'], uid: oauth['uid']).first

    if authentication
      sign_in_and_redirect(authentication.user, event: :authentication)
      set_flash_message(:notice, :success, kind: provider) if is_navigational_format?
    elsif current_user
      current_user.authentications.create(provider: oauth['provider'], uid: oauth['uid'])
      redirect_to root_path
    else
      user = User.new
      user.skip_confirmation!
      user.apply_oauth(oauth)      
      if user.save
        sign_in_and_redirect(user, event: :authentication)
        set_flash_message(:notice, :success, kind: provider) if is_navigational_format?
      else
        session['devise.oauth'] = oauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

end