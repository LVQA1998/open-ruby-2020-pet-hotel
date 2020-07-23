class GenerateUserPaymentAsPDF
  def initialize profile
    @profile = profile
  end

  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/resume.pdf")
  end

  def filename
    "Resume_#{user.username}.pdf"
  end

  private

  attr_reader :profile
  
  def as_html
    render template: "downloads/show", layout: "invoice_pdf", locals: { user: user }
  end
end
