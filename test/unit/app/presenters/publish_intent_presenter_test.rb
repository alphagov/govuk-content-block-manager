require "test_helper"

module PublishingApi
  class PublishIntentPresenterTest < ActiveSupport::TestCase
    extend Minitest::Spec::DSL

    it "it returns the publish intent" do
      base_path = "/example-path"
      publish_timestamp = Time.zone.now.to_s

      presenter = PublishingApi::PublishIntentPresenter.new(base_path, publish_timestamp)
      expected_hash = {
        publish_time: publish_timestamp,
        publishing_app: ContentBlockManager::PublishingApp::CONTENT_BLOCK_MANAGER,
        routes: [{ path: base_path, type: "exact" }],
      }

      assert_equal presenter.as_json, expected_hash
    end
  end
end
