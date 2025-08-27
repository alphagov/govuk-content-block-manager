class ContentBlockManager::ContentBlock::Document::Index::FilterOptionsComponent < ViewComponent::Base
  include ActionView::Helpers::RecordTagHelper
  def initialize(filters:, errors: nil)
    @filters = filters
    @errors = errors
  end

private

  def items_for_block_type
    ContentBlockManager::ContentBlock::Schema.valid_schemas.map do |schema_name|
      {
        label: schema_name.humanize,
        value: schema_name,
        checked: @filters.any? && @filters[:block_type]&.include?(schema_name),
      }
    end
  end

  def all_organisations_option(selected_orgs)
    {
      text: "All organisations",
      value: "",
      selected: selected_orgs.compact.empty?,
    }
  end

  def taggable_organisations_options(_selected_orgs)
    # TODO: Migrate code to fetch organisations from Publishing API
    # helpers.taggable_organisations_container(selected_orgs)
    [
      { text: "HM Revenue & Customs (HMRC)", value: 1, selected: false },
      { text: "Test Organisation (TO)", value: 2, selected: false },
    ]
  end

  def options_for_lead_organisation(selected_orgs = [])
    [all_organisations_option(selected_orgs), taggable_organisations_options(selected_orgs)].flatten
  end
end
