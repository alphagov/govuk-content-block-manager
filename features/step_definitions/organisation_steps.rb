Given(/^the organisation "([^"]*)" exists$/) do |name|
  create_org_and_stub_content_store(:ministerial_department, name:)
end
