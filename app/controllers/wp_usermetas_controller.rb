class WpUsermetasController < ApplicationController
  before_action :set_wp_usermeta, only: [:wp_usermeta, :show, :edit, :update, :destroy]

  def wp_usermetas
    @wp_usermetas = WpUsermeta.all
  end

  def show
    @wp_usermeta = WpUsermeta.find(params[:id])
  end

  def edit
    @wp_usermeta = WpUsermeta.find(params[:id])
  end

  def new
    @wp_usermeta = WpUsermeta.new
    @date = Time.now.strftime("%Y-%m-%d %H:%M:%S")
  end

  # POST /sortings
  # POST /sortings.json
  def create
    @wp_postmeta = WpPost.new(wp_postmeta_params)

    respond_to do |format|
      if @wp_postmeta.save
        format.html { redirect_to wp_postmetas_path, notice: 'Postmeta was successfully created.' }
        format.json { render :show, status: :created, location: @wp_postmeta }
      else
        format.html { render :new }
        format.json { render json: @wp_postmeta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sortings/1
  # PATCH/PUT /sortings/1.json
  def update
    respond_to do |format|
      if @wp_postmeta.update(wp_postmeta_params)
        format.html { redirect_to @wp_postmeta, notice: 'Postmeta was successfully updated.' }
        format.json { render :show, status: :ok, location: @wp_postmeta }
      else
        format.html { render :edit }
        format.json { render json: @wp_postmeta.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @wp_postmeta.destroy
    respond_to do |format|
      format.html { redirect_to wp_postmetas_path, notice: 'Postmeta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

	
	private

  def set_wp_usermeta
    @wp_postmeta = WpPostmeta.find(params[:id])
  end


  def wp_usermeta_params
    params.require(:wp_usermeta).permit(:user_id, :id, :meta_key, :meta_value)
  end

end