class Organisation < ApplicationRecord
  has_many :editions, through: :edition_organisations

  has_many :users, foreign_key: :organisation_slug, primary_key: :slug, dependent: :nullify

  validates :slug, presence: true, uniqueness: { case_sensitive: false }
  # validates_with SafeHtmlValidator
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :govuk_status, presence: true, inclusion: { in: %w[live joining exempt transitioning closed] }
  validates :govuk_closed_status, inclusion: { in: %w[no_longer_exists replaced split merged changed_name left_gov devolved] }, presence: true, if: :closed?

  delegate :ministerial_department?, to: :type
  delegate :devolved_administration?, to: :type

  scope :closed, -> { where(govuk_status: "closed") }

  def self.with_published_editions
    where("exists (
      SELECT 1 FROM `editions`
      INNER JOIN `edition_organisations` ON `edition_organisations`.`edition_id` = `editions`.`id`
      WHERE `editions`.`state` = 'published'
      AND (edition_organisations.organisation_id = organisations.id)
    )")
  end

  def live?
    govuk_status == "live"
  end

  def closed?
    govuk_status == "closed"
  end

  def exempt?
    govuk_status == "exempt"
  end

  def replaced?
    govuk_closed_status == "replaced"
  end

  def split?
    govuk_closed_status == "split"
  end

  def merged?
    govuk_closed_status == "merged"
  end

  def changed_name?
    govuk_closed_status == "changed_name"
  end

  def devolved?
    govuk_closed_status == "devolved"
  end

  def name_without_prefix
    name.gsub(/^The/, "").strip
  end

  def display_name
    [acronym, name].detect(&:present?)
  end

  def select_name
    [name, ("(#{acronym})" if acronym.present?), ("[Closed]" if closed?)].compact.join(" ")
  end

  def published_editions
    editions.published
  end

  def to_s
    name
  end

  def news_priority_homepage?
    homepage_type == "news"
  end

  def base_path
    "/government/organisations/#{slug}"
  end

  def public_path(options = {})
    append_url_options(base_path, options)
  end

  def link_to_section_on_organisation_list_page
    append_url_options("/government/organisations", anchor: slug)
  end

  def public_url(options = {})
    website_root = if options[:draft]
                     Plek.external_url_for("draft-origin")
                   else
                     Plek.website_root
                   end

    website_root + public_path(options)
  end

  def publishing_api_presenter
    PublishingApi::OrganisationPresenter
  end
end
