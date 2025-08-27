require_relative "./locale"

module ContentBlockManager
  def self.product_name
    "Content Block Manager"
  end

  def self.support_url
    "#{Plek.external_url_for('support')}/general_request/new"
  end

  def self.support_email_address
    "feedback-content-modelling@digital.cabinet-office.gov.uk"
  end

  def self.integration_or_staging?
    website_root = ENV.fetch("GOVUK_WEBSITE_ROOT", "")
    %w[integration staging].any? { |environment| website_root.include?(environment) }
  end
end
