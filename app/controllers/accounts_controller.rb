class AccountsController < ApplicationController

  # before "/accounts/*" do
  #   if !request.post?
  #     if !logged_in
  #       @alert_msg[:danger_alert] = "Please login to choose new accounts."
  #       erb :'users/login'
  #     end
  #   end
  # end

  # INDEX: accounts view all.
  get '/accounts' do
    @accounts = Account.order('updated_at ASC').limit(10)
    # @accounts = Account.all.order('updated_at DESC').paginate(page: params[:page], per_page: 5)
    erb :'accounts/index'
  end

  # NEW: accounts new
  get '/accounts/new' do

    if !logged_in
      @alert_msg[:danger_alert] = "Please login to choose new Account."
      erb :'users/login'
    else
      @account = Account.new  ## Prevents errors on Form Partial.
      erb :'accounts/new'
    end

  end


  # CREATE:
  post '/accounts' do
    @account = Account.create(params[:account])
    redirect '/accounts'
  end

  # SHOW: displays a single account detail page.
  get '/accounts/:id' do
    @account = Account.find(params[:id])
    erb :'accounts/show'
  end

  # EDIT:
  get '/accounts/:id/edit' do
    @account = Account.find(params[:id])
    erb :'accounts/edit'
  end

  ##### Update Method (patch or put) ####

  # UPDATE: Method for patch and put
  def update_account
    @account = Account.find(params[:id])
    @account.update(params[:account])
    redirect "/accounts/#{@account.id}"
  end

  # UPDATE: patch
  patch '/accounts/:id' do
    update_account
  end

  # UPDATE: put
  put '/accounts/:id' do
    update_account
  end

  #################################

  # DELETE:
  delete '/accounts/:id' do
    Account.find(params[:id]).destroy!
    redirect '/accounts'
  end

end

