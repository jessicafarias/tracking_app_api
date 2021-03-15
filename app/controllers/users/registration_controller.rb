module Users
  class RegistrationController < ApiGuard::RegistrationController
    before_action :authenticate_resource, only: [:destroy]

    def create
      @user = User.new(user_params)
      @user.password = params[:password_digest]
      @user.password_confirmation = params[:password_digest]
      if @user.save
        create_token_and_set_header(@user, @user.name)
        render_success(message: I18n.t('api_guard.registration.signed_up'))
      else
        render_error(422, object: @user)
      end
    end

    def destroy
      current_resource.destroy
      render_success(message: I18n.t('api_guard.registration.account_deleted'))
    end

    private


    def user_params
      params.permit(:email, :password_digest, :name)
    end
  end
end
