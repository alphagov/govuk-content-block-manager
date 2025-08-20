require "record_tag_helper/helper"

module ApplicationHelper
  include ActionView::Helpers::RecordTagHelper

  def get_content_id(edition)
    return if edition.nil?

    return unless edition.respond_to?("content_id")

    edition.content_id
  end
end
