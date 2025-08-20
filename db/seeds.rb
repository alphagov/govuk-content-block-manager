return if Rails.env.test?

gds_organisation_id = "af07d5a5-df63-4ddc-9383-6a666845ebe9"
User.create!(
  name: "Test user",
  uid: "test-user-1",
  email: "test@gds.example.com",
  permissions: ["signin", "GDS Admin", "GDS Editor", "Managing Editor", "Sidekiq Admin"],
  organisation_content_id: gds_organisation_id,
  organisation_slug: "government-digital-service",
)
