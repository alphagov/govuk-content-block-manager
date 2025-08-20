FactoryBot.define do
  factory :organisation do
    sequence(:name) { |index| "organisation-#{index}" }
    organisation_type_key { :other }
    slug { name }
  end

  factory :ministerial_department, parent: :organisation do
    organisation_type_key { :ministerial_department }
  end

  factory :non_ministerial_department, parent: :organisation do
    organisation_type_key { :non_ministerial_department }
  end
end
