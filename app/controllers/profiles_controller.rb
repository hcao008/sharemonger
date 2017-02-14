class ProfilesController < ApplicationController
  def new
    # creating a new empty Profile object
    @profile =Profile.new
  end

  #create action creates a new Profile record associated with a User
  def create
    @profile = current_user.build_profile(profile_params)
    if @profile.save
      #Show successful flash message and redirect to courses list
      flash[:notice] = 'You have created a new profile'
      redirect_to profile_path(@profile)
    else
      #render the new template
      render :new
    end
  end

#Get /profile
def index
  @profile = Profile.all
end

def edit
    @profile = Profile.find(params[:id])
end

def update
  @profile = Profile.find(params[:id])
  respond_to do |format|
    if @profile.update(profile_params)
      format.html { redirect_to @profile, notice: 'profile was successfully updated.' }
      format.json { render :show, status: :ok, location: @profile }
    else
      format.html { render :edit }
      format.json { render json: @profile.errors, status: :unprocessable_entity }
    end
  end
end

#GET /profile/1
#GET /profile/1.json
def show
  @profile = current_user.profile
  @hash = Gmaps4rails.build_markers(@profiles) do |profile, marker|
  marker.lat profile.latitude
  marker.lng profile.longitude
  marker.infowindow profile.first_name
  end
end

  private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :biography, :picture, :street, :state, :suburb, :postcode, :country)
  end
end
