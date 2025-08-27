require_relative "./locale"

module ContentBlockManager
  def self.integration_or_staging?
    website_root = ENV.fetch("GOVUK_WEBSITE_ROOT", "")
    %w[integration staging].any? { |environment| website_root.include?(environment) }
  end
end
