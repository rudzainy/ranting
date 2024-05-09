class StaticController < ApplicationController
  impressionist
  before_action :set_should_render_navbar

  def index
  end

  def membership
  end

  def licences_disclaimer
  end

  def contact
  end

  def about
  end

  def use_cases
  end

  def faq 
  end

  def mailing_list
    new_email = params[:email_address]
    if Truemail.valid?(new_email, with: :regex)
      if MailingListEmail.create!(email_address: new_email)
        render turbo_stream: turbo_stream.replace("mailing_list_form", partial: "layouts/mailing_list_form/success", locals: {subscribed_email: new_email}) 
      end
    else
      render turbo_stream: turbo_stream.replace("mailing_list_form", partial: "layouts/mailing_list_form/error", locals: {subscribed_email: new_email})
    end
    
  rescue
    render turbo_stream: turbo_stream.replace("mailing_list_form", partial: "layouts/mailing_list_form/error", locals: {subscribed_email: new_email})
  end

  private

  def set_should_render_navbar
    if user_signed_in?
      @should_render_navbar = true
    end
  end
end
