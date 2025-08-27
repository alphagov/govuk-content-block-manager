class ContentBlockManager::ContentBlock::Edition::Details::Fields::CountryComponent < ContentBlockManager::ContentBlock::Edition::Details::Fields::EnumComponent
  BLANK_OPTION = "United Kingdom".freeze

  def initialize(**args)
    # TODO: Comment out until we have migrated WorldLocations to come from Publishing API
    # countries = WorldLocation.geographical.map(&:name)
    countries = ["United Kingdom", "United States of America", "France"]
    super(**args.merge(enum: countries))
  end

private

  def enum
    @enum.excluding(blank_option)
  end

  def blank_option
    BLANK_OPTION
  end
end
