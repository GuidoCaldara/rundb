class OrganisationsController < ApplicationController
 before_action :set_organization, only: [:show, :edit, :update, :destroy]

 def index
  @organisations = Organisation.all
end

def new
  @organisation = Organisation.new
end

def create
  @organisation = Organisation.new(organisation_params)
  @organisation.user_id = current_user.id
  if @organisation.save
    redirect_to organisation_path(@organisation.id)
  else
    render action: 'new'
  end
end

def show
  @races = @organisation.races
end

def edit
end

def update
 if @organisation.update(organisation_params)
  redirect_to organisation_path(@organisation.id)
else
  render action: 'edit'
end
end

def destroy
  if has_race?(@organisation)
    redirect_to organisation_path(@organisation.id)
    flash[:danger] = "Seems like your organisation has some race on the database. Before delete your organisation delete all the races!"
  else
    @organisation.destroy
    redirect_to root_path
    flash[:success] = "Your organisation has been deleted! You can create another one anytime you want!"
  end
end

private

def has_race?(org)
  if Race.where(organisation_id: org.id)
   true
 else
   false
 end
end


def set_organization
  @organisation = Organisation.find(params[:id])
end

def organisation_params
  params.require(:organisation).permit(:email, :logo, :name, :address, :description, :phone_number, :user_id)
end


end
