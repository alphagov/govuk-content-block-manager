class ContentBlockManager::ContentBlock::Edition::Details::Fields::BooleanComponent < ContentBlockManager::ContentBlock::Edition::Details::Fields::BaseComponent
private

  def items
    [
      {
        value: true,
        label:,
        checked: value.present? ? ActiveModel::Type::Boolean.new.cast(value) : false,
      },
    ]
  end
end
