module ContentBlockManager
  module ContentBlock
    class EditionOrganisation < ApplicationRecord
      belongs_to :content_block_edition, class_name: "ContentBlockManager::ContentBlock::Edition"
      belongs_to :organisation
    end
  end
end
