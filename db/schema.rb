# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_20_105744) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "content_block_documents", force: :cascade do |t|
    t.text "content_id"
    t.text "sluggable_string"
    t.text "block_type"
    t.integer "latest_edition_id"
    t.integer "live_edition_id"
    t.string "content_id_alias"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["content_id_alias"], name: "index_content_block_documents_on_content_id_alias", unique: true
    t.index ["latest_edition_id"], name: "index_content_block_documents_on_latest_edition_id"
    t.index ["live_edition_id"], name: "index_content_block_documents_on_live_edition_id"
  end

  create_table "content_block_editions", force: :cascade do |t|
    t.json "details", null: false
    t.integer "document_id", null: false
    t.text "state", default: "draft", null: false
    t.datetime "scheduled_publication"
    t.text "instructions_to_publishers"
    t.text "title", default: "", null: false
    t.text "internal_change_note"
    t.text "change_note"
    t.boolean "major_change"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_content_block_editions_on_document_id"
    t.index ["title"], name: "index_content_block_editions_on_title"
  end

  create_table "organisations", force: :cascade do |t|
    t.text "name", null: false
    t.text "slug", null: false
    t.text "url"
    t.text "govuk_status", default: "live", null: false
    t.datetime "closed_at"
    t.text "content_id"
    t.boolean "political", default: false, null: false
    t.text "organisation_type_key", null: false
    t.text "govuk_closed_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index "upper(name)", name: "index_organisations_on_upper_name", unique: true
    t.index "upper(slug)", name: "index_organisations_on_upper_slug", unique: true
    t.index ["content_id"], name: "index_organisations_on_content_id"
    t.index ["organisation_type_key"], name: "index_organisations_on_organisation_type_key"
  end

  create_table "users", force: :cascade do |t|
    t.text "name", null: false
    t.text "uid", null: false
    t.text "email", null: false
    t.boolean "disabled", default: false
    t.boolean "remotely_signed_out", default: false
    t.text "organisation_slug"
    t.text "permissions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["organisation_slug"], name: "index_users_on_organisation_slug"
    t.index ["uid"], name: "index_users_on_uid"
  end
end
