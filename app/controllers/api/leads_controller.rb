module Api
  class LeadsController < ApplicationController
    before_action :set_lead, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token

    # GET /leads
    # GET /leads.json
    def index
      @leads = Lead.all
    end

    # GET /leads/1
    # GET /leads/1.json
    def show
    end

    # GET /leads/new
    def new
      @lead = Lead.new
    end

    # GET /leads/1/edit
    def edit
    end

    # POST /leads
    # POST /leads.json
    def create
      @lead = Lead.new(lead_params)
      if @lead.save
        render json: {
         "messages": [
            {
              "attachment":{
                "type":"template",
                "payload":{
                  "template_type":"generic",
                  "image_aspect_ratio": "square",
                  "elements":[
                    {
                      "title":"#{@lead.product}",
                      "subtitle":"Select time and date.",
                      "buttons":[
                        {
                          "type":"web_url",
                          "url":"http://chatestate.herokuapp.com/#{@lead.id}/tid?v=%20",
                          "title":"Select time/date!"
                        }
                      ]
                    }
                  ]
                }
              }
            }
          ]
        }
      end
    end

    def broadcast
      render json: {
       "messages": [
         {"text": "Vælg tidspunkt hér: www.chatestate.herokuapp.com/#{@lead.id}/tid "}
        ]
      }
    end

    # PATCH/PUT /leads/1
    # PATCH/PUT /leads/1.json
    def update
      respond_to do |format|
        if @lead.update(lead_params)
          format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
          format.json { render :show, status: :ok, location: @lead }
        else
          format.html { render :edit }
          format.json { render json: @lead.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /leads/1
    # DELETE /leads/1.json
    def destroy
      @lead.destroy
      respond_to do |format|
        format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

        def connect
          last_purchased_item = params['last purchased item']
          first_name = params['first name']
          last_name = params['last name']
          last_payment_address = params['last payment address']
          last_payment_phone = params['last payment phone']
          last_payment_email = params['last payment email']
          last_payment_charge_id = params['last payment charge id']
        end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_lead
        @lead = Lead.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def lead_params
        params.permit(:first_name, :last_name, :gender, :source, :locale, :profile_pic_url, :timezone, :messenger_user_id, :chatfuel_user_id, :ref, :country, :city, :state, :zip, :address, :latitude, :longitude, :map_url, :last_visited_block_name, :last_visited_block_id, :last_clicked_button_name, :last_user_freeform_input, :product, :timeanddate, :email, :slot_id, :secret, :phone, :user_id, :'first name', :'last name', :category, :product_type, :deadline, :purpose, :price_filter, :budget, :area, :pet, :cityarea, :rooms, :forsikring_valg)
      end
  end
end