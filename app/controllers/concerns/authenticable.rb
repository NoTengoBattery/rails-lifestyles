module Authenticable
  private
    def session_user=(user_id) # Protect against malicious crafted user_id's
      cookies.encrypted[:session_user] = (user_id&.integer? ? user_id : nil)
    end

    def session_user_destroy
      cookies.delete(:session_user)
      @_user = nil
    end

    def session_user # Protect against malicious crafted cookies
      user_id = cookies.encrypted[:session_user]
      user_id&.integer? ? (user_id) : (self.session_user_destroy; nil)
    end

    def current_user
      self.session_user ? (@_user ||= User.find(self.session_user)) : nil
    rescue ActiveRecord::RecordNotFound # Protect against malicious crafted User IDs
      self.session_user_destroy
      nil
    end

    def signed_in?
      self.current_user ? true : false
    end

    def sign_in!
      unless signed_in?
        redirect_to sign_in_path, alert: I18n.t("user.alert.need_sign_in")
      end
      true
    end

    def authorize!
      unless @user.class == User && self.current_user.id == @user.id
        redirect_back fallback_location: root_path, alert: I18n.t("user.alert.unauthorized")
      end
    end
end
