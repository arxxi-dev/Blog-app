class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		
		if current_user.present?
			admin_root_path
		else
			root_Path
		end
	end
end
