class DownloadsController < ApplicationController
  before_action :load_prodile, only: [:index, :show]

  def show
    respond_to do |format|
      format.pdf { send_user_pdf }
    end
  end

  private

  def load_user
    @user = current_user.profile.find_by id: params[:id]
  end

  def create_user_pdf
    GenerateUserPaymentAsPDF.new profile
  end

  def send_profile_pdf
    send_file create_profile_pdf.to_pdf,
      filename: profile_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end

  def render_sample_html
    render template: "downloads/profile_payment", layout: "invoice_pdf",
      locals: { profile: @profile }
  end
end
