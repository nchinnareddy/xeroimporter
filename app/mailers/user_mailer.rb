class UserMailer < ActionMailer::Base
  
  default :from => "support@xeroimporter.com"

  def register(user_id)
    @user = User.find(user_id)
    return unless @user && @user.email && !@user.email.blank?
    mail :to => @user.email, :subject => "Subject - Signup Confirmation!"
  end

end
