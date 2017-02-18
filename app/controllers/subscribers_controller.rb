class SubscribersController < ApplicationController
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]
  # after_create :add_mailchimp_subscriber
  # GET /subscribers
  # GET /subscribers.json
  def index
    @subscribers = Subscriber.all
  end

  # GET /subscribers/1
  # GET /subscribers/1.json
  def show
  end

  # GET /subscribers/new
  def new
    @subscriber = Subscriber.new
  end

  # GET /subscribers/1/edit
  def edit
  end

  # POST /subscribers
  # POST /subscribers.json
  def create
    @subscriber = Subscriber.new(subscriber_params)
    # user = OpenStruct.new(email: @subscriber.email, first_name: @subscriber.first_name, last_name: @subscriber.last_name)
    # MailChimpSubscription.subscribe(user)

    respond_to do |format|
      if @subscriber.save
        client = Mailchimp::API.new('e20ddab99446c3e46a5310c2aed58507-us12')
        client.lists.subscribe('bb17209c0b', 
                           { "email" => "awais545@gmail.com",
                             "euid" => "123",
                             "leid" => "123123"
                           })
        # client.lists.subscribe('bb17209c0b', {email: @subscriber.email}, {'FNAME' => @subscriber.first_name, 'LNAME' =>  @subscriber.last_name})
        # SubscriptionMailer.send_email(@subscriber,@blog).deliver
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully created.' }
        format.json { render :show, status: :created, location: @subscriber }
      else
        format.html { render :new }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscribers/1
  # PATCH/PUT /subscribers/1.json
  def update
    respond_to do |format|
      if @subscriber.update(subscriber_params)
        format.html { redirect_to @subscriber, notice: 'Subscriber was successfully updated.' }
        format.json { render :show, status: :ok, location: @subscriber }
      else
        format.html { render :edit }
        format.json { render json: @subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribers/1
  # DELETE /subscribers/1.json
  def destroy
    @subscriber.destroy
    respond_to do |format|
      format.html { redirect_to subscribers_url, notice: 'Subscriber was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscriber_params
      params.require(:subscriber).permit(:first_name, :last_name, :email)
    end




   def add_mailchimp_subscriber

   end
end
