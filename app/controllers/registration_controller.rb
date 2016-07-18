class RegistrationController < Devise::RegistrationsController

def new

@member= Member.new
@contact = Contact.new
end

def create

@member = Member.new(user_params)

=begin

@member.username = params[:member][:username]
@member.address = params[:member][:address]
@member.email = params[:member][:email]
@member.password = params[:member][:password]
@member.password_confirmation =params[:member][:password_confirmation]

=end

@contact = Contact.new
@contact.mobile = params[:contact][:mobile]
@contact.country = params[:contact][:country]
@member.valid?
if @member.errors.blank?

@member.save
@contact.member = @member
@contact.save
redirect_to dashboard_path
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
      params.require(:member).permit(:username, :address, :email, :password, :password_confirmation)
 end
end