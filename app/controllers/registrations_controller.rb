class RegistrationsController < Devise::RegistrationsController
  def create

    respond_to do |format|

      format.html {
        build_resource
        if resource.save      
          if resource.active_for_authentication?
            set_flash_message :notice, :signed_up if is_navigational_format?
            sign_in(resource_name, resource)
            respond_with resource, :location => after_sign_up_path_for(resource)
          else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
            expire_session_data_after_sign_in!
            respond_with resource, :location => after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          respond_with resource
        end
      }

      format.json{
        if !params[:api_key].blank? and params[:api_key] == 'BOOKAPI'
          build_resource
          if resource.save
            sign_in(resource)
            resource.reset_authentication_token!
            render :template => '/devise/registrations/signed_up' #rabl template with authentication token
          else
            render :template => '/devise/registrations/new' #rabl template with errors
          end
        else
          render :json => {'errors'=>{'api_key' => 'Invalid'}}.to_json, :status => 401
        end
      }
    end
  end

end