class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  Refile.secret_key = 'f6185a38e668e2dafa30c8fbd7c0be1868f6dcb68bd7590a150068a8c18db4a4e7509f558fde0cc89c972ade61be60d01da110cff606e010551f601f44eb8bd3'

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :department, :admin])
  end
end
