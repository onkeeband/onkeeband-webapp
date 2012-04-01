class SubscriptionController < ApplicationController
  respond_to :html, :xml, :json, :js
  def subscribe
    respond_to do |format|
      format.js do
        @fan = Subscription.new(params[:subscription])
      end
    end
  end

  def unsubscribe
  end

  def index
  end

end
