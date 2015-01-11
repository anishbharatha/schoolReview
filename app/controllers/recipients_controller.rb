class RecipientsController < ApplicationController
  before_action :set_recipient, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @recipients = Recipient.all
    respond_with(@recipients)
  end

  def show
    respond_with(@recipient)
  end

  def new
    @recipient = Recipient.new
    respond_with(@recipient)
  end

  def edit
  end

  def create
    @recipient = Recipient.new(recipient_params)
    @recipient.save
    respond_with(@recipient)
  end

  def update
    @recipient.update(recipient_params)
    respond_with(@recipient)
  end

  def destroy
    @recipient.destroy
    respond_with(@recipient)
  end

  private
    def set_recipient
      @recipient = Recipient.find(params[:id])
    end

    def recipient_params
      params.require(:recipient).permit(:message_id, :user_id, :is_read, :is_deleted)
    end
end
