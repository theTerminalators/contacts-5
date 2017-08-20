class ContactsController < ApplicationController
  def index
    # @contacts = Contact.all
    # @contacts = Contact.where(user_id: session[:user_id])
    if current_user
      @contacts = current_user.contacts
    else
      flash[:warning] = "You must be logged in to look at contacts"
      redirect_to "/login"
    end
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    if current_user && current_user.id == @contact.user_id
      render 'show.html.erb'
    else
      redirect_to "/contacts"
    end
  end

  def new
  end

  def create
    address = params[:address]
    # coordinates = Geocoder.coordinates(address)
    # input_latitude = coordinates[0]
    # input_longitude = coordinates[1]
    contact = Contact.create(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone: params[:phone],
      # latitude: input_latitude,
      # longitude: input_longitude,
      user_id: current_user.id
    )
    flash[:success] = "Contact created."
    redirect_to "/contacts/#{contact.id}"
  end

  def edit
    @contact = Contact.find_by(id: params[:id])
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone: params[:phone])
    flash[:success] = "Contact updated."
    redirect_to "/contacts/#{@contact.id}"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    flash[:success] = "Contact deleted."
    redirect_to "/"
  end

  def all_johns
    @contacts = Contact.all_johns
    render 'index.html.erb'
  end
end
