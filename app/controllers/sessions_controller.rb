class SessionsController < Devise::SessionsController
  def destroy
    respond_to do |format| 
      format.json {
        if (current_user != nil) 
          #current_user.authentication_token = nil
          current_user.save
        end
      }
    end
    super
  end
  
  def create
    resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_to do |format|
      format.html {
        respond_with resource, :location => after_sign_in_path_for(resource)        
      }
    end
  end
end