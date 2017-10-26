class ContactsController < ApplicationController

  # before "/contacts/*" do
  #   if !request.post?
  #     if !logged_in
  #       @alert_msg[:danger_alert] = "Please login to choose new contacts."
  #       erb :'users/login'
  #     end
  #   end
  # end

  # INDEX: contacts view all.
  get '/contacts' do
    @contacts = Contact.order('updated_at ASC').limit(10)
    # @contacts = Contact.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'contacts/index'
  end

  # NEW: contacts new
  get '/contacts/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Contact."
      erb :'users/login'
    else
      @contact = Contact.new  ## Prevents errors on Form Partial.
      erb :'contacts/new'
    end

  end


  # CREATE:
  post '/contacts' do
    @contact = Contact.create(params[:contact])
    redirect '/contacts'
  end

  # SHOW: displays a single contact detail page.
  get '/contacts/:id' do
    @contact = Contact.find(params[:id])
    erb :'contacts/show'
  end

  # EDIT:
  get '/contacts/:id/edit' do
    @contact = Contact.find(params[:id])
    erb :'contacts/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_contact
    @contact = Contact.find(params[:id])
    @contact.update(params[:contact])
    redirect "/contacts/#{@contact.id}"
  end

  # UPDATE: patch
  patch '/contacts/:id' do
    update_contact
  end

  # UPDATE: put
  put '/contacts/:id' do
    update_contact
  end

  #################################

  # DELETE:
  delete '/contacts/:id' do
    Contact.find(params[:id]).destroy!
    redirect '/contacts'
  end

end

