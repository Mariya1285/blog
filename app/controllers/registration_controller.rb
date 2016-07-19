class RegistrationController < Devise::RegistrationsController

def new

	@member= Member.new

end

def create

	@member = Member.new(user_params)
	#@member.add = @member.avatar.build
	
	@member.valid?

	if @member.errors.blank?
		@member.save
		redirect_to "/"
	else
		render :action => "new"
	end

end

protected

    def after_inactive_sign_up_path_for(resource)
        '/sign_up/inactive'
    end

private

	 def user_params
      params.require(:member).permit(:username, :address, :email, :avatar, :password, :password_confirmation)
      #@member.avatar.build
 	 end
 	 
end