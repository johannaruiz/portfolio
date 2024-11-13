# frozen_string_literal: true

# Actions and Request Methods for Inquiries
class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
    @kind = params[:kind] || 'basic'
    respond_to do |format|
      format.turbo_stream { render_new_turbo_stream_response }
      format.html { render_new_html_response }
    end
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.save
      handle_successful_inquiry
    else
      handle_failed_inquiry
    end
  end

  def cancel
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace('inquiry_form', partial: 'inquiry_buttons')
      end
      format.html { render 'pages/contact' }
    end
  end

  private

  def render_new_turbo_stream_response
    render turbo_stream: turbo_stream.replace('inquiry_form', partial: 'inquiry_buttons')
  end

  def render_new_html_response
    render partial: 'form', locals: { kind: @kind, inquiry: @inquiry }
  end

  def handle_successful_inquiry
    flash.now[:notice] = t('inquiry.create.success')
    respond_to do |format|
      format.turbo_stream { render_save_success_turbo_stream }
      format.html { render 'pages/contact' }
    end
  end

  def handle_failed_inquiry
    flash.now[:error] = t('inquiry.create.failure')
    respond_to do |format|
      format.turbo_stream { render_save_failed_turbo_stream }
      format.html { render 'pages/contact' }
    end
  end

  def render_save_success_turbo_stream
    render turbo_stream: turbo_stream.replace('inquiry_form', partial: 'inquiry_buttons')
  end

  def render_save_failed_turbo_stream
    render turbo_stream: turbo_stream.replace('inquiry_form', partial: 'form',
                                                              locals: { inquiry: @inquiry, kind: @inquiry.kind })
  end

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message, :kind, :phone, :company)
  end
end
