class WpOptionsController < ApplicationController
  before_action :set_wp_options, only: [:wp_user, :show, :edit, :update, :destroy]

  def wp_users
    @wp_usermetas = WpUsermeta.first
    @wp_users = WpUser.all
  end

  def show
    @wp_user = WpUser.find(params[:id])
  end

  def edit
    @wp_user = WpUser.find(params[:id])
  end

  def new
    @wp_user = WpUser.new
  end

  # POST /sortings
  # POST /sortings.json
  def create
    @wp_user = WpUser.new(wp_user_params)

    respond_to do |format|
      if @wp_user.save
        format.html { redirect_to wp_users_path, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @wp_user }
      else
        format.html { render :new }
        format.json { render json: @wp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sortings/1
  # PATCH/PUT /sortings/1.json
  def update
    respond_to do |format|
      if @wp_user.update(wp_user_params)
        format.html { redirect_to @wp_user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @wp_user }
      else
        format.html { render :edit }
        format.json { render json: @wp_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wp_user.destroy
    respond_to do |format|
      format.html { redirect_to wp_users_path, notice: 'user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	
	private

  def set_wp_options
    @wp_options = WpOptions.find(params[:id])
  end


  def wp_user_params
    params.require(:wp_user).permit(:id, :user_login, :user_pass, :user_nicename, :user_email, :user_url, :user_registered, :user_activation_key, :user_status, :display_name)
  end

end