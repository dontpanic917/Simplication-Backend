class SubscriptionsController < ApplicationController
  before_action :authorize_request
  before_action :set_subscription, only: [:show, :update, :destroy]

  # GET /subscriptions
  def index
    subscriptionObj = {}
    @current_user.subscriptions.map {|scrip| subscriptionObj[scrip.name] = {feedUrl: scrip.feedUrl, items:{}}}
    render json: subscriptionObj
  end

  # GET /subscriptions/1
  def show

  end

  # POST /subscriptions
  def create
    @subscription = Subscription.new(subscription_params)

    if @subscription.save
      subscriptionObj = {}
      subscriptionObj[@subscription.name] = {feedUrl: @subscription.feedUrl, items: {}}
      render json: subscriptionObj, status: :created, location: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subscriptions/1
  def update
    if @subscription.update(subscription_params)
      render json: @subscription
    else
      render json: @subscription.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subscriptions/1
  def destroy
    @subscription.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subscription_params
      params.require(:subscription).permit(:name, :feedUrl).merge(user_id: current_user.id)
    end
end
