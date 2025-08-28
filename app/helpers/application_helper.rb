require "record_tag_helper/helper"

module ApplicationHelper
  include ActionView::Helpers::RecordTagHelper

  def get_content_id(edition)
    return if edition.nil?

    return unless edition.respond_to?("content_id")

    edition.content_id
  end

  def linked_author(author, link_options = {})
    if author&.uid
      link_to(author.name, content_block_manager_user_path(author.uid), link_options)
    else
      author&.name || "-"
    end
  end

  def add_indefinite_article(noun)
    indefinite_article = starts_with_vowel?(noun) ? "an" : "a"
    "#{indefinite_article} #{noun}"
  end

  def starts_with_vowel?(word_or_phrase)
    "aeiou".include?(word_or_phrase.downcase[0])
  end

  def taggable_organisations_container(selected_ids)
    Organisation.all.map do |o|
      {
        text: o.name,
        value: o.id,
        selected: selected_ids.include?(o.id),
      }
    end
  end
end
