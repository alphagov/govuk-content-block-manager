require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  extend Minitest::Spec::DSL

  describe "#add_indefinite_article" do
    it "prepends word with 'an' when a word starts with a vowel" do
      %w[
        apple
        egg
        igloo
        office
        unlikely
      ].each do |word|
        assert_equal add_indefinite_article(word), "an #{word}"
      end
    end

    it "prepends word with 'a' when a word does not start with a vowel" do
      %w[
        bike
        car
        dog
        flag
        goat
      ].each do |word|
        assert_equal add_indefinite_article(word), "a #{word}"
      end
    end
  end

  describe "#linked_author" do
    let(:user) { build(:user) }

    it "links to an author if set" do
      assert_equal linked_author(user), link_to(user.name, content_block_manager_user_path(user.uid), {})
    end

    it "passes link options to link_to" do
      assert_equal linked_author(user, { class: "my-link" }), link_to(user.name, content_block_manager_user_path(user.uid), { class: "my-link" })
    end

    it "returns an unlinked user name if the user does not have a uuid" do
      user.uid = nil
      assert_equal linked_author(user), user.name
    end

    it "returns a dash if user is not set" do
      assert_equal linked_author(nil), "-"
    end
  end

  describe "#taggable_organisations_container" do
    let(:organisations) { build_list(:organisation, 3) }

    before do
      Organisation.stubs(:all).returns(organisations)
    end

    it "returns all organisations" do
      expected = [
        {
          text: organisations[0].name,
          value: organisations[0].id,
          selected: false,
        },
        {
          text: organisations[1].name,
          value: organisations[1].id,
          selected: false,
        },
        {
          text: organisations[2].name,
          value: organisations[2].id,
          selected: false,
        },
      ]

      assert_equal taggable_organisations_container([]), expected
    end

    it "marks selected organisations" do
      expected = [
        {
          text: organisations[0].name,
          value: organisations[0].id,
          selected: false,
        },
        {
          text: organisations[1].name,
          value: organisations[1].id,
          selected: false,
        },
        {
          text: organisations[2].name,
          value: organisations[2].id,
          selected: true,
        },
      ]

      assert_equal taggable_organisations_container([organisations[2].id]), expected
    end
  end
end
