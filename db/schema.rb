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

ActiveRecord::Schema.define(version: 2022_01_13_151001) do

  create_table "autonumber_types", primary_key: "autonumber_type_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "autonumber_type_name", limit: 50, null: false
    t.string "autonumber_type_prefix", limit: 20, null: false
    t.string "autonumber_type_dynamic", limit: 20, null: false
    t.string "autonumber_type_suffix", limit: 20, null: false
    t.string "autonumber_type_starting_value", limit: 10, null: false
    t.boolean "autonumber_type_starting_value_reset", null: false
  end

  create_table "checks", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "des", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "communication_persons", primary_key: "communication_person_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "communication_person_name", limit: 200, null: false
    t.string "communication_person_email", limit: 200, null: false
    t.string "communication_person_mobile_no", limit: 13, null: false
    t.index ["communication_person_name"], name: "communication_person_name"
  end

  create_table "communication_scenario_email_persons", primary_key: "communication_scenario_email_person_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.boolean "communication_scenario_email_send_type", null: false
    t.bigint "communication_person_id", null: false
    t.bigint "communication_scenario_email_id", null: false
    t.index ["communication_person_id"], name: "communication_person_id"
    t.index ["communication_scenario_email_id"], name: "communication_scenario_email_id"
  end

  create_table "communication_scenario_emails", primary_key: "communication_scenario_email_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "communication_scenario_id", null: false
    t.string "communication_scenario_email_subject", limit: 200, null: false
    t.string "communication_scenario_email_path", limit: 200, null: false
    t.text "communication_scenario_email_text", null: false
    t.boolean "communication_scenario_email_status", null: false
    t.index ["communication_scenario_id"], name: "communication_scenario_id"
  end

  create_table "communication_scenario_sms", primary_key: "communication_scenario_sms_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "communication_scenario_id", null: false
    t.text "communication_scenario_sms_text", null: false
    t.string "communication_scenario_sms_additional_param", limit: 300, null: false
    t.boolean "communication_scenario_sms_status", null: false
    t.index ["communication_scenario_id"], name: "communication_scenario_id"
  end

  create_table "communication_scenario_sms_persons", primary_key: "communication_scenario_sms_person_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "communication_person_id", null: false
    t.bigint "communication_scenario_sms_id", null: false
    t.index ["communication_person_id"], name: "communication_person_id"
    t.index ["communication_scenario_sms_id"], name: "communication_scenario_sms_id"
  end

  create_table "communication_scenarios", primary_key: "communication_scenario_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "communication_scenario_name", limit: 200, null: false
    t.text "communication_scenario_description", null: false
    t.boolean "communication_scenario_status", null: false
    t.index ["communication_scenario_name"], name: "communication_scenario_name"
  end

  create_table "daily_report_details", primary_key: "daily_report_details_id", id: :integer, charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "daily_report_id"
    t.integer "account_transaction_id", null: false
    t.date "account_transaction_date", null: false
    t.integer "account_transaction_amount", null: false
    t.string "account_transaction_type", limit: 30, null: false
    t.integer "account_transaction_ref", null: false
    t.integer "account_id", null: false
    t.date "created_at", null: false
  end

  create_table "daily_reports", primary_key: "daily_report_id", id: :integer, charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "account_id"
    t.string "current_balance"
    t.date "date"
  end

  create_table "discount_type_masters", primary_key: "dis_feetype_id", id: :integer, charset: "latin1", force: :cascade do |t|
    t.string "dis_feetype_name", limit: 250, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "discout_type_masters", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "dynamic_symbols", primary_key: "dynamic_symbol_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "dynamic_symbol_name", limit: 150, null: false
    t.string "dynamic_symbol_value", limit: 10, null: false
  end

  create_table "failed_jobs", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "uuid", null: false
    t.text "connection", null: false
    t.text "queue", null: false
    t.text "payload", size: :long, null: false
    t.text "exception", size: :long, null: false
    t.timestamp "failed_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["uuid"], name: "failed_jobs_uuid_unique", unique: true
  end

  create_table "fee_masters", primary_key: "fee_master_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "fee_type_name", null: false
    t.integer "order_id", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "fees_types", primary_key: "fee_type_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "fee_type_name", null: false
    t.integer "grade_id", null: false
    t.integer "fee_amount", null: false
    t.integer "academic_year", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.bigint "fee_master_id", null: false
  end

  create_table "file_directory", primary_key: "file_directory_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.boolean "file_directory_type", null: false
    t.bigint "parent_file_directory_id", null: false
    t.string "file_directory_name", limit: 150, null: false
    t.string "file_directory_display_name", limit: 150, null: false
    t.string "file_directory_format", limit: 50, null: false
    t.text "file_directory_content", null: false
  end

  create_table "form_display_type", primary_key: "form_display_type_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "form_display_type_name", limit: 150, null: false
    t.string "form_display_filename", limit: 150, null: false
    t.text "form_display_style", null: false
  end

  create_table "form_field_display_types", primary_key: "form_field_display_type_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "form_field_display_type_name", limit: 250, null: false
    t.string "form_field_display_type_filename", limit: 250, null: false
  end

  create_table "grade_section", primary_key: "grade_section_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "grade", null: false
    t.string "section", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "input_validation_types", primary_key: "input_validation_type_id", id: :integer, charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "input_validation_type_name", limit: 50, null: false
    t.string "input_validation_type_description", limit: 300, null: false
    t.string "input_validation_type_regex", limit: 200, null: false
    t.string "input_validation_type_message", limit: 300, null: false
  end

  create_table "login", primary_key: "login_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "login_fullname", limit: 250, null: false
    t.bigint "profile_id", null: false
    t.bigint "login_default_module_id", null: false
    t.bigint "menu_id", null: false
    t.string "login_email_id", limit: 250, null: false
    t.string "login_password", limit: 150, null: false
    t.string "login_photo", limit: 250, null: false
    t.boolean "login_status", null: false
    t.datetime "login_create_time", null: false
    t.datetime "login_last_sign_in_time", null: false
    t.datetime "login_last_sign_out_time", null: false
    t.bigint "login_link_ref_id", null: false
    t.index ["login_default_module_id"], name: "ix_fk_login_default_module_id"
    t.index ["login_link_ref_id"], name: "ix_fk_login_link_ref_id"
    t.index ["login_status"], name: "ix_login_status"
    t.index ["menu_id"], name: "ix_fk_menu_id"
    t.index ["profile_id"], name: "ix_fk_profile_id"
  end

  create_table "login_activities", primary_key: "login_activity_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "module_id", null: false
    t.bigint "login_id", null: false
    t.bigint "permission_type_id", null: false
    t.text "login_activity_description", null: false
    t.datetime "login_activity_datetime", null: false
    t.bigint "login_activity_ref_id", null: false
    t.index ["login_activity_ref_id"], name: "ix_login_activity_ref_id"
    t.index ["login_id"], name: "ix_fk_login_id"
    t.index ["module_id"], name: "ix_fk_module_id"
    t.index ["permission_type_id"], name: "ix_fk_permission_type_id"
  end

  create_table "menu", primary_key: "menu_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "menu_name", limit: 150, null: false
    t.string "menu_icon", limit: 150, null: false
    t.boolean "menu_node_type", null: false
    t.bigint "parent_menu_id", null: false
    t.boolean "menu_display_type", null: false
    t.boolean "menu_link_type", null: false
    t.bigint "module_id", null: false
    t.text "menu_link_url", null: false
    t.boolean "menu_status", null: false
    t.bigint "menu_position", null: false
    t.index ["menu_node_type"], name: "ix_menu_node_type"
    t.index ["menu_position"], name: "ix_menu_position"
    t.index ["menu_status"], name: "ix_menu_status"
    t.index ["module_id"], name: "ix_fk_module_id"
    t.index ["parent_menu_id"], name: "ix_fk_parent_menu_id"
  end

  create_table "migrations", id: { type: :integer, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "migration", null: false
    t.integer "batch", null: false
  end

  create_table "module", primary_key: "module_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "module_name", limit: 150, null: false
    t.string "module_display_name", limit: 150, null: false
    t.boolean "module_type", null: false
    t.boolean "module_node_type", null: false
    t.boolean "module_child_display_type", null: false
    t.bigint "parent_module_id", null: false
    t.bigint "module_alias_main_module_id", null: false
    t.boolean "module_exclude_in_parent_add", null: false
    t.boolean "module_is_group", null: false
    t.boolean "module_allow_group_edit", null: false
    t.boolean "module_is_allow_multiple_times", null: false
    t.boolean "module_is_require_checkbox", null: false
    t.boolean "module_is_autogenerated", null: false
    t.bigint "module_autogenerated_table_column_id", null: false
    t.boolean "module_add_submodule_arrangement", null: false
    t.boolean "module_hide_detail_view_action", null: false
    t.bigint "form_display_type_id", null: false
    t.text "module_description", null: false
    t.boolean "module_notification", null: false
    t.text "module_notification_html", null: false
    t.string "module_directory", limit: 250, null: false
    t.string "module_file_name", limit: 150, null: false
    t.boolean "module_status", null: false
    t.bigint "module_position", null: false
    t.bigint "table_id", null: false
    t.boolean "module_display_type", null: false
    t.boolean "module_dependency_type", null: false
    t.boolean "module_list_selection", null: false
    t.boolean "module_list_serial_num", null: false
    t.boolean "module_list_display_per_page", null: false
    t.boolean "module_is_required_validation", null: false
    t.boolean "module_form_size", null: false
    t.bigint "module_parent_column_id", null: false
    t.index ["module_alias_main_module_id"], name: "ix_fk_module_alias_main_module_id"
    t.index ["module_autogenerated_table_column_id"], name: "ix_fk_module_autogenerated_table_column_id"
    t.index ["module_parent_column_id"], name: "ix_fk_module_parent_column_id"
    t.index ["module_position"], name: "module__module_position"
    t.index ["module_status"], name: "module__module_status"
    t.index ["parent_module_id"], name: "module__module_parent_id"
    t.index ["table_id"], name: "ix_fk_table_id"
  end

  create_table "module_form_field_ajax", primary_key: "module_form_field_ajax_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "module_form_field_id", null: false
    t.bigint "module_form_field_ajax_parent_module_id", null: false
    t.string "module_form_field_ajax_file", limit: 250, null: false
    t.bigint "module_form_field_ajax_response_update_form_field_id", null: false
    t.boolean "module_form_field_ajax_populate_by", null: false
    t.index ["module_form_field_ajax_parent_module_id"], name: "ix_fk_module_form_field_ajax_parent_module_id"
    t.index ["module_form_field_ajax_response_update_form_field_id"], name: "ix_fk_module_form_field_ajax_response_update_form_field_id"
    t.index ["module_form_field_id"], name: "ix_fk_module_form_field_id"
  end

  create_table "module_form_field_display_conditions", primary_key: "module_form_field_display_condition_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "module_form_field_id", null: false
    t.bigint "module_form_field_display_condition_form_field_id", null: false
    t.bigint "dynamic_symbol_id", null: false
    t.boolean "module_form_field_display_condition_comparison_type", null: false
    t.string "module_form_field_display_condition_form_field_value", limit: 10, null: false
    t.index ["dynamic_symbol_id"], name: "ix_fk_dynamic_symbol_id"
    t.index ["module_form_field_display_condition_form_field_id"], name: "ix_fk_module_form_field_display_condition_form_field_id"
    t.index ["module_form_field_id"], name: "ix_fk_module_form_field_id"
  end

  create_table "module_form_fields", primary_key: "module_form_field_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "module_id", null: false
    t.string "module_form_label", limit: 250, null: false
    t.string "module_form_label_alt_name", limit: 250, null: false
    t.string "module_form_field_placeholder", limit: 250, null: false
    t.text "module_form_field_help_text", null: false
    t.text "module_form_field_popover", null: false
    t.boolean "module_form_field_is_array", null: false
    t.string "module_form_field_name", limit: 150, null: false
    t.string "module_form_field_id_str", limit: 150, null: false
    t.bigint "form_field_display_type_id", null: false
    t.string "module_form_field_class", limit: 150, null: false
    t.string "module_form_field_style", limit: 150, null: false
    t.string "module_form_field_attribute", limit: 250, null: false
    t.boolean "module_form_field_validation_type", null: false
    t.integer "input_validation_type_id", null: false
    t.boolean "module_form_field_type", null: false
    t.bigint "module_form_field_column_id", null: false
    t.bigint "module_form_field_text_column_id", null: false
    t.boolean "module_form_field_addnew_link", null: false
    t.bigint "module_form_field_addnew_form_module_id", null: false
    t.string "module_form_field_custom_display_filename", limit: 250, null: false
    t.string "module_form_field_source_filename", limit: 250, null: false
    t.boolean "module_form_field_status", null: false
    t.bigint "module_form_field_position", null: false
    t.boolean "module_form_field_conditional_display", null: false
    t.boolean "module_form_field_conditional_display_type", null: false
    t.boolean "module_form_field_ajax_request", null: false
    t.bigint "file_directory_id", null: false
    t.bigint "module_form_field_ajax_response_module_form_field_id", null: false
    t.index ["input_validation_type_id"], name: "ix_fk_input_validation_type_id"
    t.index ["module_form_field_addnew_form_module_id"], name: "ix_fk_module_form_field_addnew_form_module_id"
    t.index ["module_form_field_column_id"], name: "ix_fk_module_form_field_column_id"
    t.index ["module_form_field_position"], name: "ix_module_form_field_position"
    t.index ["module_form_field_status"], name: "ix_module_form_field_status"
    t.index ["module_form_field_text_column_id"], name: "ix_fk_module_form_field_text_column_id"
    t.index ["module_id"], name: "ix_fk_module_id"
  end

  create_table "module_list_actions", primary_key: "module_list_action_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "module_id", null: false
    t.integer "module_list_action_type", limit: 1, null: false
    t.string "module_list_action_custom_icon", limit: 150, null: false
    t.string "module_list_action_custom_text", limit: 150, null: false
    t.string "module_list_action_custom_filename", limit: 150, null: false
    t.bigint "module_list_action_custom_permission_type_id", null: false
    t.integer "module_list_action_position", null: false
    t.index ["module_id"], name: "ix_fk_module_id"
    t.index ["module_list_action_custom_permission_type_id"], name: "ix_fk_module_list_action_custom_permission_type_id"
    t.index ["module_list_action_position"], name: "ix_module_list_action_position"
  end

  create_table "module_list_fields", primary_key: "module_list_field_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "module_id", null: false
    t.string "module_list_field_heading", limit: 150, null: false
    t.boolean "module_list_field_display_type", null: false
    t.boolean "module_list_field_type", null: false
    t.bigint "module_list_field_column_id", null: false
    t.string "module_list_field_alias_column_name", limit: 100, null: false
    t.bigint "module_list_field_text_column_id", null: false
    t.bigint "module_list_field_link_module_id", null: false
    t.bigint "module_list_field_link_column_id", null: false
    t.string "module_list_field_class", limit: 250, null: false
    t.string "module_list_field_style", limit: 250, null: false
    t.string "module_list_field_custom_display_filename", limit: 250, null: false
    t.boolean "module_list_field_sorting", null: false
    t.boolean "module_list_field_status", null: false
    t.bigint "module_list_field_position", null: false
    t.index ["module_list_field_column_id"], name: "ix_fk_module_list_field_column_id"
    t.index ["module_list_field_link_column_id"], name: "ix_fk_module_list_field_link_column_id"
    t.index ["module_list_field_link_module_id"], name: "ix_fk_module_list_field_link_module_id"
    t.index ["module_list_field_position"], name: "ix_module_list_field_position"
    t.index ["module_list_field_status"], name: "ix_module_list_field_status"
    t.index ["module_list_field_text_column_id"], name: "ix_fk_module_list_field_text_column_id"
  end

  create_table "module_list_ordering", primary_key: "module_list_ordering_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "module_id", null: false
    t.bigint "table_column_id", null: false
    t.boolean "module_list_ordering_order", null: false
    t.bigint "module_list_ordering_position", null: false
    t.index ["module_id"], name: "ix_fk_module_id"
    t.index ["module_list_ordering_position"], name: "ix_module_list_ordering_position"
    t.index ["table_column_id"], name: "ix_fk_table_column_id"
  end

  create_table "module_permissions", primary_key: "module_permission_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "module_id", null: false
    t.bigint "permission_type_id", null: false
    t.index ["module_id"], name: "ix_fk_module_id"
    t.index ["permission_type_id"], name: "ix_fk_permission_type_id"
  end

  create_table "module_profile_permissions", primary_key: "module_profile_permission_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "module_permission_id", null: false
    t.index ["module_permission_id"], name: "ix_fk_module_permission_id"
    t.index ["profile_id"], name: "ix_fk_profile_id"
  end

  create_table "numbers", primary_key: "number_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "autonumber_type_id", null: false
    t.string "number_prefix", limit: 20, null: false
    t.string "number_dynamic", limit: 20, null: false
    t.string "number_value", limit: 10, null: false
    t.string "number_suffix", limit: 20, null: false
  end

  create_table "oauth_access_tokens", id: { type: :string, limit: 100 }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", unsigned: true
    t.bigint "client_id", null: false, unsigned: true
    t.string "name"
    t.text "scopes"
    t.boolean "revoked", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.datetime "expires_at"
    t.index ["user_id"], name: "oauth_access_tokens_user_id_index"
  end

  create_table "oauth_auth_codes", id: { type: :string, limit: 100 }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", null: false, unsigned: true
    t.bigint "client_id", null: false, unsigned: true
    t.text "scopes"
    t.boolean "revoked", null: false
    t.datetime "expires_at"
    t.index ["user_id"], name: "oauth_auth_codes_user_id_index"
  end

  create_table "oauth_clients", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "user_id", unsigned: true
    t.string "name", null: false
    t.string "secret", limit: 100
    t.string "provider"
    t.text "redirect", null: false
    t.boolean "personal_access_client", null: false
    t.boolean "password_client", null: false
    t.boolean "revoked", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["user_id"], name: "oauth_clients_user_id_index"
  end

  create_table "oauth_personal_access_clients", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "client_id", null: false, unsigned: true
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "oauth_refresh_tokens", id: { type: :string, limit: 100 }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "access_token_id", limit: 100, null: false
    t.boolean "revoked", null: false
    t.datetime "expires_at"
    t.index ["access_token_id"], name: "oauth_refresh_tokens_access_token_id_index"
  end

  create_table "password_resets", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.timestamp "created_at"
    t.index ["email"], name: "password_resets_email_index"
  end

  create_table "permission_types", primary_key: "permission_type_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "permission_type_name", limit: 150, null: false
    t.boolean "permission_type_status", null: false
    t.bigint "permission_type_position", null: false
  end

  create_table "prj_account_heads", primary_key: "account_head_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "account_head_name", null: false
    t.string "account_head_operation_type", limit: 50, null: false
    t.integer "account_id"
    t.integer "vendor_id", null: false
  end

  create_table "prj_account_operations", primary_key: "account_operation_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "account_operation_date", null: false
    t.string "account_operation_type", limit: 50, null: false
    t.integer "account_operation_amount", null: false
    t.boolean "account_operation_status", null: false
    t.string "account_operation_remarks", limit: 500, null: false
    t.integer "account_head_id", null: false
    t.bigint "account_id", null: false
    t.datetime "account_operation_add_datetime", null: false
    t.datetime "account_operation_last_update_datetime", null: false
    t.index ["account_id"], name: "account_id"
  end

  create_table "prj_account_transactions", primary_key: "account_transaction_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "account_transaction_date", null: false
    t.integer "account_transaction_amount", null: false
    t.string "account_transaction_type", limit: 30, null: false
    t.integer "account_transaction_ref", null: false
    t.integer "account_id", null: false
    t.date "created_at", null: false
  end

  create_table "prj_account_transfers", primary_key: "account_transfer_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "account_transfer_date", null: false
    t.integer "account_transfer_source_account_id", null: false
    t.integer "account_transfer_receiving_account_id", null: false
    t.integer "account_transfer_amount", null: false
    t.string "account_transfer_remarks", limit: 500, null: false
    t.datetime "account_transfer_add_datetime", null: false
    t.datetime "account_transfer_last_update_datetime", null: false
  end

  create_table "prj_accounts", primary_key: "account_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "account_name", null: false
    t.boolean "account_show_dashboard", null: false
  end

  create_table "prj_classes", primary_key: "class_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "class", limit: 500, null: false
  end

  create_table "prj_employee_advances", primary_key: "employee_advance_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "employee_advance_date", null: false
    t.string "employee_advance_type", limit: 50, null: false
    t.decimal "employee_advance_amount", precision: 10, null: false
    t.string "employee_advance_remarks", limit: 500, null: false
    t.integer "employee_id", null: false
    t.index ["employee_id"], name: "employee_id"
  end

  create_table "prj_employee_cadres", primary_key: "employee_cadre_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "employee_cadre_name", limit: 50, null: false
  end

  create_table "prj_employees", primary_key: "employee_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "employee_name", limit: 50, null: false
    t.integer "employee_cadre_id", null: false
    t.index ["employee_cadre_id"], name: "employee_cadre_id"
  end

  create_table "prj_hostel_advances", primary_key: "hostel_advance_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "hostel_advance_date", null: false
    t.integer "hostel_student_id", null: false
    t.string "hostel_advance_type", limit: 11, null: false
    t.decimal "hostel_advance_amount", precision: 10, null: false
    t.string "hostel_advance_remarks", limit: 300, null: false
    t.index ["hostel_student_id"], name: "hostel_student_id"
  end

  create_table "prj_hostel_students", primary_key: "hostel_student_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "hostel_student_name", limit: 300, null: false
    t.string "hostel_student_class", limit: 100, null: false
    t.decimal "hostel_student_required_amount", precision: 10, null: false
    t.integer "class_id", null: false
  end

  create_table "prj_iit_fee_payments", primary_key: "iit_fee_payment_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=FIXED", force: :cascade do |t|
    t.date "iit_fee_payment_date", null: false
    t.decimal "iit_fee_payment_amount", precision: 65, null: false
    t.integer "iit_fee_id", null: false
    t.index ["iit_fee_id"], name: "iit_fee_id"
  end

  create_table "prj_iit_fees", primary_key: "iit_fee_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "iit_fee_student_name", limit: 300, null: false
    t.string "iit_fee_student_class", limit: 100, default: "0", null: false
    t.decimal "iit_fee_amount", precision: 50, null: false
    t.integer "class_id", null: false
    t.string "iit_fee_amount_year", limit: 11, null: false
  end

  create_table "prj_outstanding_summary", primary_key: "outstanding_id", id: :integer, charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "outstanding_name", limit: 500, null: false
    t.string "outstanding_fee_amount", limit: 20, null: false
    t.string "outstanding_amount_collected", limit: 20, null: false
  end

  create_table "prj_vendor_bills", primary_key: "vendor_bill_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "vendor_bill_date", null: false
    t.string "vendor_bill_amount", limit: 50, null: false
    t.string "vendor_bill_remarks", limit: 500, null: false
    t.integer "vendor_id", null: false
    t.index ["vendor_id"], name: "vendor_id"
  end

  create_table "prj_vendor_transactions", primary_key: "vendor_transaction_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.date "vendor_transaction_date", null: false
    t.string "vendor_transaction_type", limit: 50, null: false
    t.string "vendor_transaction_ref", limit: 30, null: false
    t.decimal "vendor_transaction_amount", precision: 12, scale: 2, null: false
    t.integer "vendor_id", null: false
    t.index ["vendor_id"], name: "vendor_id"
  end

  create_table "prj_vendors", primary_key: "vendor_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "vendor_name", null: false
    t.string "vendor_mobile", limit: 50, null: false
    t.string "vendor_address", null: false
    t.string "vendor_bank_name", limit: 500, null: false
    t.string "vendor_bank_account_name", null: false
    t.string "vendor_bank_account_number", limit: 50, null: false
    t.string "vendor_bank_account_type", limit: 50, default: "1", null: false
    t.string "vendor_bank_ifsc", limit: 50, null: false
  end

  create_table "profile", primary_key: "profile_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "parent_profile_id", null: false
    t.string "profile_name", limit: 250, null: false
    t.text "profile_description", null: false
    t.boolean "profile_linked", null: false
    t.integer "profile_link_table_id", null: false
    t.bigint "profile_link_module_id", null: false
    t.bigint "profile_link_email_column_id", null: false
    t.bigint "profile_link_password_column_id", null: false
    t.bigint "profile_link_name_column_id", null: false
    t.bigint "profile_link_default_menu_id", null: false
    t.index ["parent_profile_id"], name: "ix_fk_parent_profile_id"
    t.index ["profile_link_module_id"], name: "ix_fk_profile_link_module_id"
  end

  create_table "profiles", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "settings", primary_key: "setting_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "setting_group_id", null: false
    t.string "setting_name", limit: 150, null: false
    t.text "setting_value", null: false
    t.text "setting_description", null: false
    t.index ["setting_group_id"], name: "settings__setting_group_id"
  end

  create_table "settings_group", primary_key: "setting_group_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "setting_group_name", limit: 150, null: false
    t.boolean "setting_group_status", null: false
    t.integer "setting_group_position", null: false
    t.index ["setting_group_position"], name: "ix_setting_group_position"
    t.index ["setting_group_status"], name: "ix_setting_group_status"
  end

  create_table "student_admissions", primary_key: "student_admissions_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "student_name", null: false
    t.date "DOB", null: false
    t.string "gender", null: false
    t.string "email"
    t.date "admission_date", null: false
    t.string "academic_year", null: false
    t.string "grade_id", null: false
    t.string "section", limit: 50, null: false
    t.string "previous_school_info"
    t.string "father_name", null: false
    t.string "father_occupation", null: false
    t.string "address", null: false
    t.string "phone_number", null: false
    t.string "alt_phone_number", limit: 50
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string "stu_code", default: "MVM", null: false
    t.string "student_id", null: false
    t.string "status"
    t.integer "admission_no", null: false
    t.index ["student_id"], name: "student_id"
  end

  create_table "student_allocations", primary_key: "student_allocation_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "academic_year", null: false
    t.string "from_grade_id"
    t.string "to_grade_id", null: false
    t.string "from_section_id"
    t.string "to_section_id", null: false
    t.string "student_type"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.bigint "student_admissions_id", null: false, unsigned: true
    t.string "student_id"
    t.index ["student_admissions_id"], name: "student_admissions_id"
  end

  create_table "student_payment_infos", primary_key: "student_payment_info_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "student_admissions_id", null: false, unsigned: true
    t.integer "fee_master_id"
    t.date "payment_date"
    t.string "academic_year", null: false
    t.integer "actual_fees", null: false
    t.decimal "amount_paid", precision: 12, scale: 2, default: "0.0"
    t.string "payment_mode"
    t.string "comments"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.integer "year_of_fees_id"
    t.string "student_id"
    t.string "grade_id"
    t.string "fee_type_id"
    t.decimal "refund", precision: 12, scale: 2, default: "0.0"
    t.index ["student_admissions_id"], name: "student_payment_infos_student_id_foreign"
    t.index ["student_id"], name: "student_id"
  end

  create_table "table_api_methods", primary_key: "table_api_method_id", id: :integer, charset: "latin1", options: "ENGINE=MyISAM ROW_FORMAT=FIXED", force: :cascade do |t|
    t.boolean "table_api_method", null: false
    t.boolean "table_api_method_auth", null: false
    t.boolean "table_api_get_pagination", null: false
    t.integer "table_api_get_per_page", limit: 2, null: false
    t.integer "table_id", null: false
    t.index ["table_id"], name: "ix_fk_table_id"
  end

  create_table "table_column_constants", primary_key: "table_column_constant_id", id: :integer, charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "table_column_constant_text", limit: 50, null: false
    t.string "table_column_constant_value", limit: 50, null: false
    t.integer "table_column_constant_position", null: false
    t.integer "table_column_id", null: false
  end

  create_table "table_columns", primary_key: "table_column_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "table_id", null: false
    t.string "table_column_name", limit: 150, null: false
    t.string "table_column_display_name", limit: 150, null: false
    t.text "table_column_help_text", null: false
    t.integer "table_column_speciality", limit: 1, null: false
    t.bigint "file_directory_id", null: false
    t.string "table_column_file_directory", limit: 250, null: false
    t.boolean "table_column_file_is_image", null: false
    t.boolean "table_column_file_image_dimension", null: false
    t.string "table_column_file_image_width", limit: 10, null: false
    t.string "table_column_file_image_height", limit: 10, null: false
    t.boolean "table_column_constant", null: false
    t.boolean "table_column_parent", null: false
    t.boolean "table_column_unique", null: false
    t.boolean "table_column_search", null: false
    t.string "table_column_max_length", limit: 50, null: false
    t.string "table_column_insert_default_value", limit: 150, null: false
    t.boolean "table_column_is_display_name", null: false
    t.integer "autonumber_type_id", null: false
    t.boolean "table_column_autoupdate_datetime", null: false
    t.boolean "table_column_in_api_response", null: false
    t.string "table_column_api_alias", limit: 100, null: false
    t.boolean "table_column_in_api_filter", null: false
    t.boolean "table_column_api_filter_criteria", null: false
    t.boolean "table_column_in_api_update", null: false
    t.boolean "table_column_req_in_post_api", null: false
    t.index ["autonumber_type_id"], name: "ix_fk_autonumber_type_id"
    t.index ["table_id"], name: "ix_fk_table_id"
  end

  create_table "table_defaults", primary_key: "table_default_id", id: :integer, charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.integer "table_id", null: false
    t.boolean "table_default_type", null: false
    t.bigint "table_default_column_id", null: false
    t.bigint "table_default_column_value", null: false
    t.index ["table_default_type"], name: "table_defaults__table_default_type"
    t.index ["table_id"], name: "table_defaults__table_id"
  end

  create_table "table_details", primary_key: "table_id", id: :integer, charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.string "table_name", limit: 100, null: false
    t.string "table_display_name", limit: 100, null: false
    t.boolean "table_type", null: false
    t.boolean "table_in_rest_api", null: false
    t.string "table_api_endpoint", limit: 50, null: false
  end

  create_table "table_links", primary_key: "table_link_id", charset: "latin1", options: "ENGINE=InnoDB ROW_FORMAT=DYNAMIC", force: :cascade do |t|
    t.bigint "table_id", null: false
    t.bigint "table_link_base_table_column_id", null: false
    t.bigint "table_link_ref_column_id", null: false
    t.boolean "table_link_operation_on_delete", null: false
    t.boolean "table_link_recursive", null: false
    t.boolean "table_link_conditional", null: false
    t.bigint "table_link_condition_column_id", null: false
    t.boolean "table_link_condition_value", null: false
    t.text "table_link_prevent_message", null: false
    t.boolean "table_link_hide_warning_ondelete", null: false
    t.bigint "table_link_reset_default_value", null: false
    t.boolean "table_link_ignore_dynamic_join", null: false
    t.boolean "table_link_exists_always", null: false
    t.index ["table_id"], name: "ix_fk_table_id"
    t.index ["table_link_base_table_column_id"], name: "ix_fk_table_link_base_table_column_id"
    t.index ["table_link_condition_column_id"], name: "ix_fk_table_link_condition_column_id"
    t.index ["table_link_operation_on_delete"], name: "table_links__table_link_delete_permit"
    t.index ["table_link_ref_column_id"], name: "ix_fk_table_link_ref_column_id"
  end

  create_table "users", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.timestamp "email_verified_at"
    t.string "password", default: "", null: false
    t.string "remember_token", limit: 100
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string "role", null: false
    t.string "password_digest"
    t.index ["email"], name: "users_email_unique", unique: true
  end

  create_table "year", id: false, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "year_id", null: false, auto_increment: true
    t.string "academic_year", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["year_id"], name: "year_id"
  end

  create_table "year_of_fees", primary_key: "year_of_fees_id", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "academic_year", null: false
    t.string "grade", null: false
    t.string "fee_amount", null: false
    t.bigint "fee_master_id", null: false, unsigned: true
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["fee_master_id"], name: "year_of_fees_type_id_foreign"
  end

  add_foreign_key "student_allocations", "student_admissions", column: "student_admissions_id", primary_key: "student_admissions_id", name: "student_allocations_ibfk_1"
  add_foreign_key "student_payment_infos", "student_admissions", column: "student_admissions_id", primary_key: "student_admissions_id", name: "student_payment_infos_student_id_foreign", on_delete: :cascade
  add_foreign_key "student_payment_infos", "student_admissions", column: "student_id", primary_key: "student_id", name: "student_payment_infos_ibfk_1"
  add_foreign_key "year_of_fees", "fee_masters", primary_key: "fee_master_id", name: "year_of_fees_type_id_foreign", on_delete: :cascade
end
