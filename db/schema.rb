# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130212110302) do

  create_table "forum_posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "forum_posts", ["topic_id"], :name => "index_forum_posts_on_topic_id"
  add_index "forum_posts", ["user_id"], :name => "index_forum_posts_on_user_id"

  create_table "forum_topics", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.integer  "last_user_id"
    t.datetime "last_post_at"
    t.boolean  "closed"
    t.integer  "posts_count",  :default => 0, :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "views_count",  :default => 0, :null => false
  end

  add_index "forum_topics", ["last_post_at"], :name => "index_forum_topics_on_last_post_at"
  add_index "forum_topics", ["posts_count"], :name => "index_forum_topics_on_posts_count"
  add_index "forum_topics", ["user_id"], :name => "index_forum_topics_on_user_id"

  create_table "games", :force => true do |t|
    t.string   "name",        :default => "",    :null => false
    t.string   "token",       :default => "",    :null => false
    t.boolean  "maintenance", :default => false, :null => false
    t.boolean  "published",   :default => false, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "games", ["token"], :name => "index_games_on_token", :unique => true

  create_table "languages", :force => true do |t|
    t.string "tld",  :limit => 2,  :default => "", :null => false
    t.string "name", :limit => 64, :default => "", :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title",      :default => "", :null => false
    t.string   "url"
    t.string   "author"
    t.integer  "user_id"
    t.integer  "game_id"
    t.text     "content"
    t.datetime "published",                  :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "news", ["game_id"], :name => "index_news_on_game_id"
  add_index "news", ["published"], :name => "index_news_on_published"
  add_index "news", ["user_id"], :name => "index_news_on_user_id"

  create_table "news_feeds", :force => true do |t|
    t.string   "title"
    t.string   "feed_url",      :default => "", :null => false
    t.integer  "game_id"
    t.datetime "last_accessed"
    t.string   "last_error"
  end

  add_index "news_feeds", ["game_id"], :name => "index_news_feeds_on_game_id"

  create_table "ragnarok2_base_exps", :force => true do |t|
    t.integer  "base_level",                 :default => 0, :null => false
    t.integer  "base_exp_next", :limit => 8, :default => 0, :null => false
    t.integer  "npc_base_exp",  :limit => 8, :default => 0, :null => false
    t.integer  "pro_exp_next",  :limit => 8, :default => 0, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "ragnarok2_base_exps", ["base_level"], :name => "index_ragnarok2_base_exps_on_base_level", :unique => true

  create_table "ragnarok2_citizen_drop_users", :force => true do |t|
    t.integer  "citizen_drop_id"
    t.integer  "user_id"
    t.boolean  "approved",        :default => true, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "ragnarok2_citizen_drop_users", ["citizen_drop_id", "user_id"], :name => "cuid", :unique => true
  add_index "ragnarok2_citizen_drop_users", ["citizen_drop_id"], :name => "index_ragnarok2_citizen_drop_users_on_citizen_drop_id"
  add_index "ragnarok2_citizen_drop_users", ["user_id"], :name => "index_ragnarok2_citizen_drop_users_on_user_id"

  create_table "ragnarok2_citizen_drops", :force => true do |t|
    t.integer  "citizen_id"
    t.integer  "item_id"
    t.integer  "approving_users_count",    :default => 0, :null => false
    t.integer  "disapproving_users_count", :default => 0, :null => false
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_citizen_drops", ["approving_users_count"], :name => "index_ragnarok2_citizen_drops_on_approving_users_count"
  add_index "ragnarok2_citizen_drops", ["citizen_id", "item_id"], :name => "ciid"
  add_index "ragnarok2_citizen_drops", ["citizen_id"], :name => "index_ragnarok2_citizen_drops_on_citizen_id"
  add_index "ragnarok2_citizen_drops", ["disapproving_users_count"], :name => "index_ragnarok2_citizen_drops_on_disapproving_users_count"
  add_index "ragnarok2_citizen_drops", ["item_id"], :name => "index_ragnarok2_citizen_drops_on_item_id"

  create_table "ragnarok2_citizen_items", :force => true do |t|
    t.integer  "citizen_id", :limit => 8, :default => 0, :null => false
    t.integer  "item_id",    :limit => 8, :default => 0, :null => false
    t.integer  "max",                     :default => 1, :null => false
    t.integer  "buy_type",                :default => 0, :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "ragnarok2_citizen_items", ["citizen_id"], :name => "index_ragnarok2_citizen_items_on_citizen_id"
  add_index "ragnarok2_citizen_items", ["item_id"], :name => "index_ragnarok2_citizen_items_on_item_id"

  create_table "ragnarok2_citizens", :force => true do |t|
    t.integer  "citizen_id",                  :limit => 8, :default => 0, :null => false
    t.integer  "string_name_id",              :limit => 8
    t.integer  "nationenable"
    t.integer  "string_job_name_id",          :limit => 8
    t.integer  "camp"
    t.integer  "legion"
    t.integer  "min_level"
    t.integer  "max_level"
    t.integer  "faction"
    t.integer  "closeup"
    t.integer  "direction_lock"
    t.integer  "family"
    t.integer  "grade"
    t.integer  "race"
    t.integer  "growth_type"
    t.integer  "element"
    t.integer  "nature_1"
    t.integer  "nature_2"
    t.integer  "nature_3"
    t.integer  "radius"
    t.integer  "shape_type"
    t.integer  "corpse_disappear_time"
    t.integer  "drop_id"
    t.float    "base_exp_multiplier"
    t.float    "lisence_exp_multiplier"
    t.integer  "resist_point"
    t.integer  "water_resist"
    t.integer  "earth_resist"
    t.integer  "fire_resist"
    t.integer  "wind_resist"
    t.integer  "poison_resist"
    t.integer  "saint_resist"
    t.integer  "dark_resist"
    t.integer  "psychokinesis_resist"
    t.integer  "death_resist"
    t.float    "walk_speed"
    t.float    "run_speed"
    t.float    "run_correction"
    t.integer  "idle_move_rate"
    t.float    "min_move_action_time"
    t.float    "max_move_action_time"
    t.integer  "idle_action_rate"
    t.float    "min_idle_action_time"
    t.float    "max_idle_action_time"
    t.integer  "monologue_action_rate"
    t.integer  "string_monologue_id"
    t.float    "min_monologue_action_time"
    t.float    "max_monologue_action_time"
    t.integer  "task_action_rate"
    t.float    "min_task_action_time"
    t.float    "max_task_action_time"
    t.integer  "function_type_1"
    t.integer  "function_id_1"
    t.integer  "function_type_2"
    t.integer  "function_id_2"
    t.integer  "function_type_3"
    t.integer  "function_id_3"
    t.integer  "npc_voice_type"
    t.integer  "invincibility"
    t.float    "spawn_freeze_time"
    t.integer  "patience"
    t.integer  "pain_grade"
    t.integer  "threat_reaction_point"
    t.integer  "aggro_target_selection_type"
    t.float    "reaction_bound"
    t.integer  "follow_groupid"
    t.integer  "follow_group_captain"
    t.integer  "follow_pc"
    t.float    "follow_distance"
    t.float    "attack_range"
    t.float    "attack_execution_time"
    t.float    "attack_cooldown_time"
    t.float    "trace_bound"
    t.integer  "spreadaggro"
    t.integer  "spreadaggrotype"
    t.float    "battle_start"
    t.float    "attack_time"
    t.integer  "steal_groupid"
    t.integer  "pet_id"
    t.integer  "afterdeath_funcobject_id"
    t.float    "attacklimit"
    t.integer  "skillgroup"
    t.integer  "ability_1"
    t.integer  "ability_2"
    t.integer  "ability_3"
    t.integer  "ability_4"
    t.integer  "ability_5"
    t.integer  "legion_inheritance"
    t.integer  "looting_mode"
    t.integer  "personal_reward"
    t.integer  "pvp_point"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  add_index "ragnarok2_citizens", ["citizen_id"], :name => "index_ragnarok2_citizens_on_citizen_id", :unique => true
  add_index "ragnarok2_citizens", ["max_level"], :name => "index_ragnarok2_citizens_on_max_level"
  add_index "ragnarok2_citizens", ["min_level"], :name => "index_ragnarok2_citizens_on_min_level"
  add_index "ragnarok2_citizens", ["string_job_name_id"], :name => "index_ragnarok2_citizens_on_string_job_name_id"
  add_index "ragnarok2_citizens", ["string_name_id"], :name => "index_ragnarok2_citizens_on_string_name_id"

  create_table "ragnarok2_craft_infos", :force => true do |t|
    t.integer  "craft_info_id",                  :null => false
    t.integer  "craft_learntype"
    t.integer  "protype_id"
    t.integer  "craft_itemtype_id"
    t.integer  "craft_item_id",     :limit => 8
    t.integer  "craft_item_amount"
    t.integer  "craft_level"
    t.integer  "craft_needsp"
    t.integer  "craftexp"
    t.integer  "crafttime_sec"
    t.integer  "cooltime_min"
    t.integer  "positiongroup"
    t.integer  "learn_needmoney"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "ragnarok2_craft_infos", ["craft_info_id"], :name => "index_ragnarok2_craft_infos_on_craft_info_id", :unique => true
  add_index "ragnarok2_craft_infos", ["craft_item_id"], :name => "index_ragnarok2_craft_infos_on_craft_item_id"

  create_table "ragnarok2_craft_materials", :force => true do |t|
    t.integer "craft_info_id",                             :null => false
    t.integer "item_id",       :limit => 8,                :null => false
    t.integer "material_id",   :limit => 8,                :null => false
    t.integer "amount",                     :default => 1, :null => false
  end

  add_index "ragnarok2_craft_materials", ["craft_info_id"], :name => "index_ragnarok2_craft_materials_on_craft_info_id"
  add_index "ragnarok2_craft_materials", ["item_id"], :name => "index_ragnarok2_craft_materials_on_item_id"
  add_index "ragnarok2_craft_materials", ["material_id"], :name => "index_ragnarok2_craft_materials_on_material_id"

  create_table "ragnarok2_craft_scrolls", :force => true do |t|
    t.integer "item_id",       :limit => 8, :null => false
    t.integer "craft_info_id",              :null => false
  end

  add_index "ragnarok2_craft_scrolls", ["craft_info_id"], :name => "index_ragnarok2_craft_scrolls_on_craft_info_id"
  add_index "ragnarok2_craft_scrolls", ["item_id"], :name => "index_ragnarok2_craft_scrolls_on_item_id"

  create_table "ragnarok2_dungeon_quests", :force => true do |t|
    t.integer  "quest_id",                   :null => false
    t.integer  "dungeon_id"
    t.string   "mission_name"
    t.integer  "missiontype1"
    t.integer  "missionvalue1", :limit => 8
    t.integer  "missiontype2"
    t.integer  "missionvalue2", :limit => 8
    t.integer  "missiontype3"
    t.integer  "missionvalue3", :limit => 8
    t.integer  "missiontype4"
    t.integer  "missionvalue4", :limit => 8
    t.integer  "missiontype5"
    t.integer  "missionvalue5", :limit => 8
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "ragnarok2_dungeon_quests", ["dungeon_id"], :name => "index_ragnarok2_dungeon_quests_on_dungeon_id"
  add_index "ragnarok2_dungeon_quests", ["quest_id"], :name => "index_ragnarok2_dungeon_quests_on_quest_id", :unique => true

  create_table "ragnarok2_dungeons", :force => true do |t|
    t.integer  "dungeon_id",                    :default => 0, :null => false
    t.integer  "map_index1",       :limit => 8
    t.integer  "map_index2",       :limit => 8
    t.integer  "map_index3",       :limit => 8
    t.integer  "dungeon_group_id"
    t.string   "name"
    t.integer  "map_level"
    t.string   "bind_value"
    t.integer  "map_min_level"
    t.integer  "map_max_level"
    t.integer  "quest_id",         :limit => 8
    t.string   "map_description"
    t.integer  "position_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "ragnarok2_dungeons", ["dungeon_id"], :name => "index_ragnarok2_dungeons_on_dungeon_id", :unique => true
  add_index "ragnarok2_dungeons", ["quest_id"], :name => "index_ragnarok2_dungeons_on_quest_id"

  create_table "ragnarok2_item_break_results", :force => true do |t|
    t.integer "result_id"
    t.integer "grade"
    t.integer "needed_item_id",       :limit => 8
    t.integer "needed_item_amount"
    t.integer "result_item_1_id",     :limit => 8
    t.integer "result_item_1_amount"
    t.integer "result_item_1_rate"
    t.integer "result_item_2_id",     :limit => 8
    t.integer "result_item_2_amount"
    t.integer "result_item_2_rate"
  end

  add_index "ragnarok2_item_break_results", ["result_id"], :name => "index_ragnarok2_item_break_results_on_result_id"

  create_table "ragnarok2_item_cash_infos", :force => true do |t|
    t.integer  "item_id",                  :limit => 8, :default => 0, :null => false
    t.integer  "cash_type"
    t.integer  "content_type"
    t.integer  "duration_type"
    t.integer  "duration_value"
    t.integer  "duration_extend_group_id"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
  end

  add_index "ragnarok2_item_cash_infos", ["item_id"], :name => "index_ragnarok2_item_cash_infos_on_item_id", :unique => true

  create_table "ragnarok2_item_categories", :force => true do |t|
    t.integer  "category_id",                       :default => 0, :null => false
    t.string   "name_fallback"
    t.integer  "string_category_name", :limit => 8
    t.integer  "high_category"
    t.integer  "medium_category"
    t.integer  "low_category"
    t.integer  "iconindex"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
    t.integer  "items_count",                       :default => 0, :null => false
  end

  add_index "ragnarok2_item_categories", ["high_category", "medium_category", "low_category"], :name => "categories_indices", :unique => true

  create_table "ragnarok2_item_jobs", :force => true do |t|
    t.integer  "item_id"
    t.integer  "job_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ragnarok2_item_jobs", ["item_id"], :name => "index_ragnarok2_item_jobs_on_item_id"
  add_index "ragnarok2_item_jobs", ["job_id"], :name => "index_ragnarok2_item_jobs_on_job_id"

  create_table "ragnarok2_item_sets", :force => true do |t|
    t.integer  "set_id",                  :default => 0, :null => false
    t.integer  "string_id",  :limit => 8, :default => 0, :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "ragnarok2_item_sets", ["set_id"], :name => "index_ragnarok2_item_sets_on_set_id", :unique => true

  create_table "ragnarok2_item_socket_groups", :force => true do |t|
    t.integer  "socket_group_id",     :null => false
    t.integer  "socket_type1"
    t.integer  "string_socket_name1"
    t.string   "close_icon1"
    t.string   "open_icon1"
    t.integer  "socket_type2"
    t.integer  "string_socket_name2"
    t.string   "close_icon2"
    t.string   "open_icon2"
    t.integer  "socket_type3"
    t.integer  "string_socket_name3"
    t.string   "close_icon3"
    t.string   "open_icon3"
    t.integer  "socket_type4"
    t.integer  "string_socket_name4"
    t.string   "close_icon4"
    t.string   "open_icon4"
    t.integer  "socket_type5"
    t.integer  "string_socket_name5"
    t.string   "close_icon5"
    t.string   "open_icon5"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "ragnarok2_item_socket_groups", ["socket_group_id"], :name => "index_ragnarok2_item_socket_groups_on_socket_group_id", :unique => true

  create_table "ragnarok2_items", :force => true do |t|
    t.integer  "item_id",                 :limit => 8, :default => 0, :null => false
    t.integer  "name_fallback"
    t.integer  "nationenable"
    t.integer  "item_type"
    t.integer  "item_category"
    t.integer  "grade"
    t.integer  "price_buy"
    t.integer  "stack_max"
    t.integer  "require_level"
    t.integer  "require_sex"
    t.integer  "require_job"
    t.integer  "equip_type"
    t.integer  "equip_slot"
    t.integer  "equip_slot_overlap"
    t.integer  "armor_type"
    t.integer  "bag_size"
    t.integer  "bind_type"
    t.integer  "durability"
    t.integer  "set_id"
    t.integer  "randomset_id"
    t.integer  "socket_max"
    t.integer  "effect_id_1"
    t.integer  "skill_id_1"
    t.integer  "theme_id"
    t.boolean  "is_drop"
    t.boolean  "is_deposit"
    t.boolean  "is_destruct"
    t.boolean  "is_sell"
    t.boolean  "is_trade"
    t.boolean  "is_compose"
    t.integer  "high_category_id"
    t.integer  "medium_category_id"
    t.integer  "low_category_id"
    t.integer  "string_item_name",        :limit => 8
    t.integer  "string_item_description", :limit => 8
    t.string   "mesh"
    t.string   "mesh2"
    t.integer  "default_fx"
    t.integer  "default_color"
    t.integer  "color_variation"
    t.integer  "collisiontype_id"
    t.string   "icon"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.integer  "weapon_type"
    t.integer  "item_break_result_id"
    t.integer  "socket_groupid"
  end

  add_index "ragnarok2_items", ["high_category_id", "medium_category_id", "low_category_id"], :name => "categories_indices"
  add_index "ragnarok2_items", ["item_id"], :name => "index_ragnarok2_items_on_item_id", :unique => true
  add_index "ragnarok2_items", ["require_level"], :name => "index_ragnarok2_items_on_require_level"
  add_index "ragnarok2_items", ["string_item_description"], :name => "index_ragnarok2_items_on_string_item_description"

  create_table "ragnarok2_jobs", :force => true do |t|
    t.integer  "job_id",                              :null => false
    t.string   "name_fallback"
    t.integer  "string_job_name",        :limit => 8
    t.integer  "string_job_description", :limit => 8
    t.integer  "job_category"
    t.integer  "job_type"
    t.integer  "base_job_id"
    t.integer  "arm_length"
    t.float    "global_cooldown_time"
    t.integer  "threat_modifier"
    t.integer  "job_color"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "ragnarok2_jobs", ["job_id"], :name => "index_ragnarok2_jobs_on_job_id", :unique => true
  add_index "ragnarok2_jobs", ["string_job_description"], :name => "index_ragnarok2_jobs_on_string_job_description"
  add_index "ragnarok2_jobs", ["string_job_name"], :name => "index_ragnarok2_jobs_on_string_job_name"

  create_table "ragnarok2_khara_reward_titles", :force => true do |t|
    t.integer  "title_id",                     :null => false
    t.integer  "attribute_str", :default => 0
    t.integer  "attribute_dex", :default => 0
    t.integer  "attribute_wil", :default => 0
    t.integer  "attribute_vit", :default => 0
    t.integer  "attribute_int", :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "ragnarok2_khara_reward_titles", ["title_id"], :name => "index_ragnarok2_khara_reward_titles_on_title_id", :unique => true

  create_table "ragnarok2_khara_titles", :force => true do |t|
    t.integer  "title_id",                                 :default => 0, :null => false
    t.integer  "grade_type"
    t.integer  "option_1",                    :limit => 8
    t.integer  "option_2",                    :limit => 8
    t.integer  "option_3",                    :limit => 8
    t.integer  "string_title_name_id"
    t.integer  "string_title_description_id"
    t.integer  "string_title_detail_desc_id"
    t.string   "emblem_path"
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
  end

  add_index "ragnarok2_khara_titles", ["title_id"], :name => "index_ragnarok2_khara_titles_on_title_id", :unique => true

  create_table "ragnarok2_kharas", :force => true do |t|
    t.integer  "quest_id"
    t.integer  "quest_type"
    t.integer  "auto_challenge"
    t.integer  "board_number"
    t.integer  "grid_number"
    t.integer  "icon"
    t.integer  "reward_npc_id",        :limit => 8
    t.integer  "pc_job"
    t.integer  "min_base_level"
    t.integer  "max_base_level"
    t.integer  "pc_projob"
    t.integer  "min_projob_level"
    t.integer  "max_projob_level"
    t.integer  "min_khara_point"
    t.integer  "max_khara_point"
    t.integer  "giveup"
    t.integer  "need_quest_id",        :limit => 8
    t.integer  "need_quest_status"
    t.integer  "need_khara_point"
    t.integer  "prohibition_quest_id"
    t.integer  "need_start_time"
    t.integer  "need_end_time"
    t.integer  "quest_flag"
    t.integer  "limit_time"
    t.integer  "reward_auto"
    t.integer  "reward_khara_point"
    t.integer  "reward_honor_point"
    t.integer  "reward_title_id"
    t.integer  "condition_type"
    t.integer  "condition_value1"
    t.integer  "condition_value2"
    t.integer  "condition_value3"
    t.integer  "error_msg_id",         :limit => 8
    t.integer  "action_sequence"
    t.integer  "active_type"
    t.integer  "action_type"
    t.integer  "action_value1"
    t.integer  "action_value2"
    t.integer  "action_value3"
    t.integer  "action_value4"
    t.integer  "action_value5"
    t.integer  "complete_type"
    t.integer  "complete_type_value1", :limit => 8
    t.integer  "complete_type_value2", :limit => 8
    t.integer  "complete_type_value3", :limit => 8
    t.integer  "complete_type_value4", :limit => 8
    t.integer  "complete_type_value5", :limit => 8
    t.integer  "complete_desc_id",     :limit => 8
    t.integer  "fail_type"
    t.integer  "fail_type_value1"
    t.integer  "fail_type_value2"
    t.integer  "fail_type_value3"
    t.integer  "fail_type_value4"
    t.integer  "fail_type_value5"
    t.integer  "fail_desc_id",         :limit => 8
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  add_index "ragnarok2_kharas", ["quest_id"], :name => "index_ragnarok2_kharas_on_quest_id"
  add_index "ragnarok2_kharas", ["quest_type"], :name => "index_ragnarok2_kharas_on_quest_type"

  create_table "ragnarok2_map_dungeons", :force => true do |t|
    t.integer  "map_id"
    t.integer  "dungeon_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ragnarok2_map_dungeons", ["dungeon_id", "map_id"], :name => "index_ragnarok2_map_dungeons_on_dungeon_id_and_map_id", :unique => true
  add_index "ragnarok2_map_dungeons", ["map_id"], :name => "index_ragnarok2_map_dungeons_on_map_id"

  create_table "ragnarok2_map_images", :force => true do |t|
    t.integer  "map_id",             :null => false
    t.integer  "map_part"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "ragnarok2_map_images", ["map_id"], :name => "index_ragnarok2_map_images_on_map_id"

  create_table "ragnarok2_maps", :force => true do |t|
    t.integer  "map_id",           :default => 0, :null => false
    t.string   "name"
    t.string   "map_file"
    t.integer  "map_type"
    t.integer  "max_count"
    t.float    "x"
    t.float    "y"
    t.float    "z"
    t.integer  "is_pk"
    t.integer  "is_mount"
    t.integer  "is_attack"
    t.integer  "is_skill"
    t.integer  "is_chat_log"
    t.integer  "base_exp"
    t.integer  "effect_id"
    t.integer  "contents_ver"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "correction_level"
    t.integer  "correction_equip"
  end

  add_index "ragnarok2_maps", ["map_id"], :name => "index_ragnarok2_maps_on_map_id", :unique => true

  create_table "ragnarok2_merchant_infos", :force => true do |t|
    t.integer  "entry_id",                          :default => 0, :null => false
    t.integer  "merchant_function_id", :limit => 8, :default => 0, :null => false
    t.integer  "buy_type",                          :default => 0, :null => false
    t.integer  "item_id",              :limit => 8, :default => 0, :null => false
    t.integer  "max",                               :default => 1, :null => false
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "ragnarok2_merchant_infos", ["entry_id"], :name => "index_ragnarok2_merchant_infos_on_entry_id", :unique => true
  add_index "ragnarok2_merchant_infos", ["item_id"], :name => "index_ragnarok2_merchant_infos_on_item_id"
  add_index "ragnarok2_merchant_infos", ["merchant_function_id"], :name => "index_ragnarok2_merchant_infos_on_merchant_function_id"

  create_table "ragnarok2_pro_jobs", :force => true do |t|
    t.integer  "pro_job_id",                              :default => 0, :null => false
    t.string   "protypename"
    t.integer  "string_protype",             :limit => 8
    t.string   "proskillname"
    t.integer  "string_proskill"
    t.integer  "string_trans_systemmessage"
    t.string   "trans_spirit_fx_category"
    t.integer  "start_fx1"
    t.integer  "loop_fx1"
    t.integer  "end_fx1"
    t.integer  "start_fx2"
    t.integer  "loop_fx2"
    t.integer  "end_fx2"
    t.integer  "start_fx3"
    t.integer  "loop_fx3"
    t.integer  "end_fx3"
    t.integer  "trans_buff_skill_id1",       :limit => 8
    t.integer  "trans_buff_skill_id2",       :limit => 8
    t.integer  "trans_buff_skill_id3",       :limit => 8
    t.integer  "trans_skill_id_1"
    t.integer  "trans_skill_id_2"
    t.integer  "trans_skill_id_3"
    t.integer  "trans_skill_id_4"
    t.integer  "trans_skill_id_5"
    t.integer  "guide_quest_id1",            :limit => 8
    t.integer  "guide_quest_id2",            :limit => 8
    t.integer  "guide_quest_id3",            :limit => 8
    t.integer  "guide_message_id1"
    t.integer  "guide_message_id2"
    t.integer  "guide_message_id3"
    t.datetime "created_at",                                             :null => false
    t.datetime "updated_at",                                             :null => false
  end

  add_index "ragnarok2_pro_jobs", ["pro_job_id"], :name => "index_ragnarok2_pro_jobs_on_pro_job_id", :unique => true

  create_table "ragnarok2_quest_citizens", :force => true do |t|
    t.integer "citizen_id", :limit => 8
    t.integer "quest_id",   :limit => 8
    t.boolean "is_start"
  end

  add_index "ragnarok2_quest_citizens", ["citizen_id"], :name => "index_ragnarok2_quest_citizens_on_citizen_id"
  add_index "ragnarok2_quest_citizens", ["is_start"], :name => "index_ragnarok2_quest_citizens_on_is_start"
  add_index "ragnarok2_quest_citizens", ["quest_id"], :name => "index_ragnarok2_quest_citizens_on_quest_id"

  create_table "ragnarok2_quest_infos", :force => true do |t|
    t.integer  "quest_id",           :limit => 8, :default => 0, :null => false
    t.integer  "area_id_1"
    t.integer  "complete_target_1"
    t.integer  "target_id_1",        :limit => 8
    t.float    "target_x_1"
    t.float    "target_y_1"
    t.integer  "area_id_2"
    t.integer  "complete_target_2"
    t.integer  "target_id_2",        :limit => 8
    t.float    "target_x_2"
    t.float    "target_y_2"
    t.integer  "area_id_3"
    t.integer  "complete_target_3"
    t.integer  "target_id_3",        :limit => 8
    t.float    "target_x_3"
    t.float    "target_y_3"
    t.integer  "area_id_4"
    t.integer  "complete_target_4"
    t.integer  "target_id_4",        :limit => 8
    t.float    "target_x_4"
    t.float    "target_y_4"
    t.integer  "area_id_5"
    t.integer  "complete_target_5"
    t.integer  "target_id_5",        :limit => 8
    t.float    "target_x_5"
    t.float    "target_y_5"
    t.integer  "area_id_6"
    t.integer  "complete_target_6"
    t.integer  "target_id_6",        :limit => 8
    t.float    "target_x_6"
    t.float    "target_y_6"
    t.integer  "area_id_7"
    t.integer  "complete_target_7"
    t.integer  "target_id_7",        :limit => 8
    t.float    "target_x_7"
    t.float    "target_y_7"
    t.integer  "area_id_8"
    t.integer  "complete_target_8"
    t.integer  "target_id_8",        :limit => 8
    t.float    "target_x_8"
    t.float    "target_y_8"
    t.integer  "area_id_9"
    t.integer  "complete_target_9"
    t.integer  "target_id_9",        :limit => 8
    t.float    "target_x_9"
    t.float    "target_y_9"
    t.integer  "area_id_10"
    t.integer  "complete_target_10"
    t.integer  "target_id_10",       :limit => 8
    t.float    "target_x_10"
    t.float    "target_y_10"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "ragnarok2_quest_infos", ["quest_id"], :name => "index_ragnarok2_quest_infos_on_quest_id"

  create_table "ragnarok2_quest_item_rewards", :force => true do |t|
    t.integer  "quest_id",   :limit => 8
    t.integer  "item_id",    :limit => 8
    t.integer  "amount",                  :default => 0, :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "ragnarok2_quest_item_rewards", ["item_id"], :name => "index_ragnarok2_quest_item_rewards_on_item_id"
  add_index "ragnarok2_quest_item_rewards", ["quest_id"], :name => "index_ragnarok2_quest_item_rewards_on_quest_id"

  create_table "ragnarok2_quests", :force => true do |t|
    t.integer  "quest_id",             :limit => 8, :default => 0, :null => false
    t.integer  "quest_type"
    t.integer  "area_id"
    t.integer  "start_type"
    t.integer  "start_type_id",        :limit => 8
    t.integer  "reward_npc_id",        :limit => 8
    t.integer  "recommand_base_level"
    t.integer  "min_base_level"
    t.integer  "max_base_level"
    t.integer  "pc_job"
    t.integer  "pc_projob"
    t.integer  "min_projob_level"
    t.integer  "max_projob_level"
    t.integer  "min_khara_point"
    t.integer  "max_khara_point"
    t.integer  "daily_quest"
    t.integer  "quest_frequency"
    t.integer  "quest_term"
    t.integer  "giveup"
    t.integer  "party"
    t.integer  "quest_mark"
    t.integer  "need_quest_id"
    t.integer  "need_quest_status"
    t.integer  "next_quest_id"
    t.integer  "prohibition_quest_id"
    t.integer  "need_start_time"
    t.integer  "need_end_time"
    t.integer  "need_mail_id"
    t.integer  "quest_flag"
    t.integer  "waiting_time"
    t.integer  "reward_auto"
    t.integer  "reward_money"
    t.integer  "reward_exp"
    t.integer  "reward_projob_exp"
    t.integer  "reward_khara_point"
    t.integer  "reward_type"
    t.integer  "reward_item_id1",      :limit => 8
    t.integer  "reward_item_count1"
    t.integer  "reward_item_id2",      :limit => 8
    t.integer  "reward_item_count2"
    t.integer  "reward_item_id3",      :limit => 8
    t.integer  "reward_item_count3"
    t.integer  "reward_item_id4",      :limit => 8
    t.integer  "reward_item_count4"
    t.integer  "reward_item_id5",      :limit => 8
    t.integer  "reward_item_count5"
    t.integer  "reward_skill_id",      :limit => 8
    t.integer  "condition_type"
    t.integer  "condition_value1"
    t.integer  "condition_value2"
    t.integer  "condition_value3"
    t.integer  "error_msg_id",         :limit => 8
    t.integer  "action_sequence"
    t.integer  "active_type"
    t.integer  "action_type"
    t.integer  "action_value1"
    t.integer  "action_value2"
    t.integer  "action_value3"
    t.integer  "action_value4"
    t.integer  "action_value5"
    t.integer  "complete_type"
    t.integer  "complete_type_value1"
    t.integer  "complete_type_value2"
    t.integer  "complete_type_value3"
    t.integer  "complete_type_value4"
    t.integer  "complete_type_value5"
    t.integer  "complete_desc_id",     :limit => 8
    t.integer  "trace_id"
    t.integer  "fail_type"
    t.integer  "fail_type_value1"
    t.integer  "fail_type_value2"
    t.integer  "fail_type_value3"
    t.integer  "fail_type_value4"
    t.integer  "fail_type_value5"
    t.integer  "fail_desc_id"
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "ragnarok2_quests", ["area_id"], :name => "index_ragnarok2_quests_on_area_id"
  add_index "ragnarok2_quests", ["quest_id"], :name => "index_ragnarok2_quests_on_quest_id", :unique => true
  add_index "ragnarok2_quests", ["quest_type"], :name => "index_ragnarok2_quests_on_quest_type"
  add_index "ragnarok2_quests", ["recommand_base_level"], :name => "index_ragnarok2_quests_on_recommand_base_level"

  create_table "ragnarok2_random_sets", :force => true do |t|
    t.integer "random_set_id",              :null => false
    t.integer "setbox_type"
    t.integer "item_id",       :limit => 8, :null => false
    t.integer "package"
    t.integer "ratio"
    t.integer "broadcast"
  end

  add_index "ragnarok2_random_sets", ["item_id"], :name => "index_ragnarok2_random_sets_on_item_id"
  add_index "ragnarok2_random_sets", ["random_set_id"], :name => "index_ragnarok2_random_sets_on_random_set_id"
  add_index "ragnarok2_random_sets", ["ratio"], :name => "index_ragnarok2_random_sets_on_ratio"

  create_table "ragnarok2_set_items", :force => true do |t|
    t.integer  "item_set_id", :default => 0, :null => false
    t.integer  "item_1_id",   :default => 0, :null => false
    t.integer  "item_2_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "ragnarok2_set_items", ["item_1_id"], :name => "index_ragnarok2_set_items_on_item_1_id"
  add_index "ragnarok2_set_items", ["item_2_id"], :name => "index_ragnarok2_set_items_on_item_2_id"
  add_index "ragnarok2_set_items", ["item_set_id"], :name => "index_ragnarok2_set_items_on_item_set_id"

  create_table "ragnarok2_set_traits", :force => true do |t|
    t.integer  "set_id",      :null => false
    t.integer  "trait_kind"
    t.integer  "trait_type"
    t.float    "trait_value"
    t.integer  "amount"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ragnarok2_set_traits", ["set_id"], :name => "index_ragnarok2_set_traits_on_set_id"

  create_table "ragnarok2_skill_groups", :force => true do |t|
    t.integer  "skill_group",            :limit => 8, :null => false
    t.string   "name_fallback"
    t.string   "skill_icon"
    t.integer  "ui_property"
    t.integer  "check_learn_skill"
    t.integer  "battle_start"
    t.integer  "summon_object"
    t.integer  "max_level"
    t.integer  "cooltime_group"
    t.integer  "skill_damage_base"
    t.integer  "skill_damage_add"
    t.integer  "skill_damagerate_base"
    t.integer  "skill_damagerate_add"
    t.integer  "skill_type"
    t.integer  "skill_function"
    t.float    "func_parameter_1"
    t.float    "func_parameter_2"
    t.float    "func_parameter_3"
    t.integer  "icon_type"
    t.integer  "skill_property"
    t.integer  "skill_element_type"
    t.integer  "need_base_level"
    t.integer  "need_skill_up_level"
    t.integer  "need_before_skill_id_1", :limit => 8
    t.integer  "need_before_skill_id_2", :limit => 8
    t.integer  "need_before_skill_id_3", :limit => 8
    t.integer  "targeting_object"
    t.integer  "targeting_actor_id"
    t.integer  "equip_weapon"
    t.integer  "use_weapon"
    t.boolean  "is_jump_use"
    t.boolean  "is_movable"
    t.boolean  "is_move_stop"
    t.integer  "battle_state_change"
    t.integer  "use_battle"
    t.integer  "caster_status"
    t.integer  "target_status"
    t.integer  "skill_min_range"
    t.integer  "skill_range"
    t.integer  "use_trans_time"
    t.integer  "casting_bar_type"
    t.integer  "special_cast_basis"
    t.integer  "influence_target_type"
    t.integer  "influence_bound_shape"
    t.float    "influence_bound_length"
    t.float    "influence_bound_width"
    t.float    "attack_time"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "ragnarok2_skill_groups", ["name_fallback"], :name => "index_ragnarok2_skill_groups_on_name_fallback"
  add_index "ragnarok2_skill_groups", ["skill_group"], :name => "index_ragnarok2_skill_groups_on_skill_group", :unique => true

  create_table "ragnarok2_skills", :force => true do |t|
    t.integer  "skill_id",                     :limit => 8
    t.string   "name_fallback"
    t.integer  "skill_group_id",               :limit => 8
    t.integer  "skill_level"
    t.integer  "need_skill_money"
    t.integer  "create_item_id"
    t.integer  "number_of_create_item"
    t.integer  "spended_item_id"
    t.integer  "number_of_spended_item"
    t.integer  "use_sp"
    t.integer  "use_hp"
    t.float    "casting_time"
    t.float    "minimum_casting_time"
    t.float    "excution_time"
    t.float    "cooldown_time"
    t.float    "effect_duration"
    t.float    "tick_interval"
    t.integer  "number_of_normal_influences"
    t.integer  "number_of_success_influences"
    t.integer  "skill_damage_quantity"
    t.integer  "addaggro"
    t.integer  "addaggrorate"
    t.float    "aggrorange"
    t.integer  "string_skill_name",            :limit => 8
    t.integer  "string_skill_description",     :limit => 8
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "ragnarok2_skills", ["skill_group_id"], :name => "index_ragnarok2_skills_on_skill_group_id"
  add_index "ragnarok2_skills", ["skill_id"], :name => "index_ragnarok2_skills_on_skill_id", :unique => true
  add_index "ragnarok2_skills", ["skill_level"], :name => "index_ragnarok2_skills_on_skill_level"
  add_index "ragnarok2_skills", ["string_skill_description"], :name => "index_ragnarok2_skills_on_string_skill_description"
  add_index "ragnarok2_skills", ["string_skill_name"], :name => "index_ragnarok2_skills_on_string_skill_name"

  create_table "ragnarok2_traits", :force => true do |t|
    t.integer  "item_id",      :null => false
    t.integer  "nationenable"
    t.integer  "trait_kind"
    t.integer  "trait_type"
    t.float    "trait_value1"
    t.float    "trait_value2"
    t.integer  "option_set"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "ragnarok2_traits", ["item_id"], :name => "index_ragnarok2_traits_on_item_id"

  create_table "ragnarok2_translations_citizen_descriptions", :force => true do |t|
    t.integer  "citizen_id",  :limit => 8, :default => 0, :null => false
    t.string   "translation"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_translations_citizen_descriptions", ["citizen_id"], :name => "cid", :unique => true

  create_table "ragnarok2_translations_citizen_job_names", :force => true do |t|
    t.integer  "citizen_id",  :limit => 8, :default => 0, :null => false
    t.string   "translation"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_translations_citizen_job_names", ["citizen_id"], :name => "cid", :unique => true

  create_table "ragnarok2_translations_citizen_names", :force => true do |t|
    t.integer  "citizen_id",  :limit => 8, :default => 0, :null => false
    t.string   "translation"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_translations_citizen_names", ["citizen_id"], :name => "cid", :unique => true

  create_table "ragnarok2_translations_item_categories", :force => true do |t|
    t.integer  "item_id",     :limit => 8, :default => 0, :null => false
    t.string   "translation"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_translations_item_categories", ["item_id"], :name => "iid", :unique => true

  create_table "ragnarok2_translations_item_descriptions", :force => true do |t|
    t.integer  "item_id",     :limit => 8, :default => 0, :null => false
    t.string   "translation"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_translations_item_descriptions", ["item_id"], :name => "iid", :unique => true

  create_table "ragnarok2_translations_item_names", :force => true do |t|
    t.integer  "item_id",     :limit => 8, :default => 0, :null => false
    t.string   "translation"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_translations_item_names", ["item_id"], :name => "iid", :unique => true

  create_table "ragnarok2_translations_item_sets", :force => true do |t|
    t.integer  "item_set_id", :limit => 8, :default => 0, :null => false
    t.string   "translation"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_translations_item_sets", ["item_set_id"], :name => "sid", :unique => true

  create_table "ragnarok2_translations_job_names", :force => true do |t|
    t.integer  "job_id",      :limit => 8, :default => 0, :null => false
    t.string   "translation"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_translations_job_names", ["job_id"], :name => "jid", :unique => true

  create_table "ragnarok2_translations_khara_reward_titles", :force => true do |t|
    t.integer  "title_id",          :null => false
    t.string   "title"
    t.string   "description_short"
    t.string   "description_long"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "ragnarok2_translations_khara_reward_titles", ["title_id"], :name => "index_ragnarok2_translations_khara_reward_titles_on_title_id", :unique => true

  create_table "ragnarok2_translations_kharas", :force => true do |t|
    t.integer  "quest_id",   :default => 0, :null => false
    t.string   "title"
    t.string   "summary"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "ragnarok2_translations_kharas", ["quest_id"], :name => "index_ragnarok2_translations_kharas_on_quest_id", :unique => true

  create_table "ragnarok2_translations_quests", :force => true do |t|
    t.integer  "quest_id",      :limit => 8, :default => 0, :null => false
    t.string   "dialog_title"
    t.string   "quest_title"
    t.text     "summary_text"
    t.text     "start_text"
    t.text     "start_demand"
    t.text     "retry_text"
    t.text     "finish_text"
    t.text     "finish_demand"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "ragnarok2_translations_quests", ["quest_id"], :name => "index_ragnarok2_translations_quests_on_quest_id", :unique => true

  create_table "ragnarok2_translations_skill_descriptions", :force => true do |t|
    t.integer  "skill_id"
    t.string   "translation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ragnarok2_translations_skill_descriptions", ["skill_id"], :name => "sid", :unique => true

  create_table "ragnarok2_translations_skill_names", :force => true do |t|
    t.integer  "skill_id"
    t.string   "translation"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "ragnarok2_translations_skill_names", ["skill_id"], :name => "sid", :unique => true

  create_table "ragnarok2_translations_trait_names", :force => true do |t|
    t.integer  "trait_id",    :limit => 8, :default => 0, :null => false
    t.string   "translation"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
  end

  add_index "ragnarok2_translations_trait_names", ["trait_id"], :name => "tid", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "roles", ["name"], :name => "index_roles_on_name", :unique => true

  create_table "rose_citizens", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "npc_filename"
    t.integer  "walking_speed"
    t.integer  "running_speed"
    t.integer  "npc_size"
    t.integer  "weapon_id_right"
    t.integer  "weapon_id_left"
    t.integer  "level"
    t.integer  "hp"
    t.integer  "atk"
    t.integer  "accuracy"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "flee"
    t.integer  "atk_speed"
    t.integer  "magic"
    t.integer  "ai_type"
    t.integer  "exp"
    t.integer  "drop_items"
    t.integer  "money"
    t.integer  "drop_item"
    t.integer  "trade_tab1"
    t.integer  "trade_tab2"
    t.integer  "trade_tab3"
    t.integer  "trade_tab4"
    t.integer  "target_type"
    t.integer  "atk_range"
    t.integer  "character_type"
    t.integer  "texture_type"
    t.integer  "icon_number",                :default => 0,  :null => false
    t.integer  "general_sound_effect"
    t.integer  "attacking_sound_effect"
    t.integer  "attacked_sound_effect"
    t.integer  "atk_effect"
    t.integer  "dying_effect"
    t.integer  "dying_sound_effect"
    t.integer  "death_event_targets"
    t.integer  "glow_effect"
    t.string   "npc_description"
    t.string   "death_event_triggers"
    t.integer  "hp_gauge_bar"
    t.integer  "model_attribute"
    t.integer  "singleton_npc"
    t.integer  "skill_distance"
    t.integer  "team_number"
    t.integer  "taunt_immunity"
    t.integer  "force_death_animation"
    t.integer  "hide_nameplate"
    t.integer  "decloak_chance_percent"
    t.integer  "interactive_object_type"
    t.integer  "interact_event_target"
    t.string   "interact_event_trigger"
    t.string   "interact_condition_trigger"
    t.integer  "self_skill_number"
    t.integer  "visibility"
    t.integer  "hp_gauge_visibility"
    t.integer  "crash"
    t.integer  "crash_index"
    t.integer  "crash_box_x"
    t.integer  "crash_box_y"
    t.integer  "crash_box_z"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_engine_parts", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "model_filename"
    t.integer  "item_slot"
    t.integer  "item_restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "part_type"
    t.integer  "part_version"
    t.integer  "avatar_board"
    t.integer  "required_skill"
    t.integer  "required_skill_level"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "durability"
    t.integer  "slope"
    t.integer  "maximum_fuel"
    t.integer  "fuel_consumption"
    t.integer  "movement_speed"
    t.integer  "terrain"
    t.integer  "atk_range"
    t.integer  "atk"
    t.integer  "atk_speed"
    t.integer  "redundancy"
    t.integer  "seating_capacity"
    t.integer  "behavior_type"
    t.integer  "avatar_action_type"
    t.integer  "model_effect"
    t.integer  "sound_effect"
    t.integer  "dying_effect"
    t.integer  "dying_sound_effect"
    t.integer  "destruction_effect"
    t.integer  "destruction_sound_effect"
    t.integer  "idle_sfx"
    t.integer  "movement_effect"
    t.integer  "movment_sfx"
    t.integer  "primary_effect"
    t.integer  "attack_sfx"
    t.integer  "damage_effect"
    t.integer  "hit_sfx"
    t.integer  "bullet_effect"
    t.integer  "p1"
    t.integer  "p2"
    t.integer  "p3"
    t.integer  "p4"
    t.integer  "p5"
    t.integer  "p6"
    t.integer  "p7"
    t.integer  "p8"
    t.integer  "firing_point_1"
    t.integer  "firing_point_2"
    t.integer  "firing_point_3"
    t.integer  "cart_gauge"
    t.integer  "occupations"
    t.integer  "magic_damage"
    t.integer  "ability"
    t.integer  "break"
    t.integer  "pat_class"
    t.integer  "planet_restriction"
    t.integer  "damage_calculation_type"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_equipment_backs", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "male_model"
    t.integer  "item_restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "required_job_1_id"
    t.integer  "required_job_2_id"
    t.integer  "required_job_3_id"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "required_ability_2_id"
    t.integer  "required_ability_2_value"
    t.integer  "requirements_1"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "requierements_2"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "durability"
    t.integer  "dodge"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "movement_speed"
    t.integer  "name_prefix_id"
    t.integer  "costume_bonus_flag"
    t.integer  "product"
    t.integer  "refine"
    t.integer  "break"
    t.integer  "pvp_atk"
    t.integer  "pvp_def"
    t.integer  "pvm_atk"
    t.integer  "pvm_def"
    t.string   "model_attribute"
    t.integer  "rare_type"
    t.integer  "item_set_id"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_equipment_bodies", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "male_model"
    t.string   "female_model"
    t.integer  "item_restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "required_job_1_id"
    t.integer  "required_job_2_id"
    t.integer  "required_job_3_id"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "required_ability_2_id"
    t.integer  "required_ability_2_value"
    t.integer  "requirements_1"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "requierements_2"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "durability"
    t.integer  "dodge"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "movement_speed"
    t.integer  "name_prefix_id"
    t.integer  "costume_bonus_flag"
    t.integer  "product"
    t.integer  "refine"
    t.integer  "break"
    t.integer  "pvp_atk"
    t.integer  "pvp_def"
    t.integer  "pvm_atk"
    t.integer  "pvm_def"
    t.string   "model_attribute"
    t.integer  "rare_type"
    t.integer  "item_set_id"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_equipment_boots", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "male_model"
    t.string   "female_model"
    t.integer  "item_restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "required_job_1_id"
    t.integer  "required_job_2_id"
    t.integer  "required_job_3_id"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "required_ability_2_id"
    t.integer  "required_ability_2_value"
    t.integer  "requirements_1"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "requierements_2"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "durability"
    t.integer  "dodge"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "movement_speed"
    t.integer  "name_prefix_id"
    t.integer  "costume_bonus_flag"
    t.integer  "product"
    t.integer  "refine"
    t.integer  "break"
    t.integer  "pvp_atk"
    t.integer  "pvp_def"
    t.integer  "pvm_atk"
    t.integer  "pvm_def"
    t.string   "model_attribute"
    t.integer  "rare_type"
    t.integer  "item_set_id"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_equipment_gloves", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "male_model"
    t.string   "female_model"
    t.integer  "item_restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "required_job_1_id"
    t.integer  "required_job_2_id"
    t.integer  "required_job_3_id"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "required_ability_2_id"
    t.integer  "required_ability_2_value"
    t.integer  "requirements_1"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "requierements_2"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "durability"
    t.integer  "dodge"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "material_type"
    t.integer  "name_prefix_id"
    t.integer  "costume_bonus_flag"
    t.integer  "product"
    t.integer  "refine"
    t.integer  "break"
    t.integer  "pvp_atk"
    t.integer  "pvp_def"
    t.integer  "pvm_atk"
    t.integer  "pvm_def"
    t.string   "model_attribute"
    t.integer  "rare_type"
    t.integer  "item_set_id"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_equipment_headgears", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "male_model"
    t.string   "female_model"
    t.integer  "item_restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "required_job_1_id"
    t.integer  "required_job_2_id"
    t.integer  "required_job_3_id"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "required_ability_2_id"
    t.integer  "required_ability_2_value"
    t.integer  "requirements_1"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "requierements_2"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "durability"
    t.integer  "dodge"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "male_hair_option"
    t.integer  "female_hair_option"
    t.integer  "costume_bonus_flag"
    t.integer  "product"
    t.integer  "refine"
    t.integer  "break"
    t.integer  "pvp_atk"
    t.integer  "pvp_def"
    t.integer  "pvm_atk"
    t.integer  "pvm_def"
    t.string   "model_attribute"
    t.integer  "rare_type"
    t.integer  "item_set_id"
    t.integer  "name_prefix_id"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_equipment_jewels", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.integer  "item_restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "required_job_1_id"
    t.integer  "required_job_2_id"
    t.integer  "required_job_3_id"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "required_ability_2_id"
    t.integer  "required_ability_2_value"
    t.integer  "requirements_1"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "requierements_2"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "durability"
    t.integer  "dodge"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "product"
    t.integer  "refine"
    t.integer  "break"
    t.integer  "pvp_atk"
    t.integer  "pvp_def"
    t.integer  "pvm_atk"
    t.integer  "pvm_def"
    t.string   "model_attribute"
    t.integer  "rare_type"
    t.integer  "item_set_id"
    t.integer  "name_prefix_id"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_equipment_masks", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "male_model"
    t.string   "female_model"
    t.integer  "item_restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "required_job_1_id"
    t.integer  "required_job_2_id"
    t.integer  "required_job_3_id"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "required_ability_2_id"
    t.integer  "required_ability_2_value"
    t.integer  "requirement_union1"
    t.integer  "additional_increase_stat1"
    t.integer  "additional_increase_value1"
    t.integer  "requirement_union2"
    t.integer  "additional_increase_stat2"
    t.integer  "additional_increase_value2"
    t.integer  "durability"
    t.integer  "dodge"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "texture"
    t.integer  "product"
    t.integer  "refine"
    t.integer  "break"
    t.integer  "pvp_atk"
    t.integer  "pvp_def"
    t.integer  "pvm_atk"
    t.integer  "pvm_def"
    t.string   "model_attribute"
    t.integer  "rare_type"
    t.integer  "item_set_id"
    t.integer  "name_prefix_id"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_gems", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.integer  "item_restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "socket_graphic"
    t.integer  "glow_effect"
    t.integer  "option_percent_1"
    t.integer  "option_percent_2"
    t.integer  "decomposition_numbers"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_item_abilities", :force => true do |t|
    t.integer "item_attributable_id"
    t.string  "item_attributable_type"
    t.integer "ability_id",             :default => 0,     :null => false
    t.integer "value",                  :default => 0,     :null => false
    t.boolean "required",               :default => false, :null => false
  end

  add_index "rose_items_item_abilities", ["item_attributable_type", "item_attributable_id", "ability_id", "required"], :name => "taa", :unique => true
  add_index "rose_items_item_abilities", ["required"], :name => "index_rose_items_item_abilities_on_required"

  create_table "rose_items_materials", :force => true do |t|
    t.string   "name",                         :default => "", :null => false
    t.integer  "use_Limit"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_number"
    t.integer  "sound_fx"
    t.integer  "crafting_number"
    t.integer  "crafting_level"
    t.integer  "crafting_material"
    t.integer  "crafting_difficulty"
    t.integer  "crafting_requiered_item_type"
    t.integer  "bullet_type"
    t.integer  "refine_bonus"
    t.string   "item_description"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  create_table "rose_items_quest_items", :force => true do |t|
    t.string   "name",             :default => "", :null => false
    t.integer  "item_type_id"
    t.integer  "icon_number"
    t.integer  "quest_image"
    t.string   "quest_id"
    t.string   "item_description"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "rose_items_weapons_main_weapons", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "model_filename"
    t.integer  "restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_item"
    t.integer  "equipping_sound_effect"
    t.integer  "crafting_id"
    t.integer  "crafting_level"
    t.integer  "crafting_material_id"
    t.integer  "crafting_difficulty"
    t.integer  "required_job_1_id"
    t.integer  "required_job_2_id"
    t.integer  "required_job_3_id"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "required_ability_2_id"
    t.integer  "required_ability_2_value"
    t.integer  "requirement_union1"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "requirement_union2"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "durability"
    t.integer  "accuracy"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "range"
    t.integer  "motion_type"
    t.integer  "atk"
    t.integer  "atk_speed"
    t.integer  "magic"
    t.integer  "effect_type"
    t.integer  "basic_effect"
    t.integer  "start_sound_effect"
    t.integer  "shooting_sound_effect"
    t.integer  "hitting_sound_effect"
    t.integer  "gem_effect_location"
    t.integer  "upgrade_no"
    t.integer  "tier_grade"
    t.integer  "disassembly_no"
    t.integer  "pvp_atk"
    t.integer  "pvp_def"
    t.integer  "pvm_atk"
    t.integer  "pvm_def"
    t.string   "model_attribute"
    t.integer  "number_of_gems"
    t.integer  "item_set_id"
    t.integer  "name_prefix_id"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_items_weapons_sub_weapons", :force => true do |t|
    t.string   "name",                       :default => "", :null => false
    t.string   "model_filename"
    t.integer  "restriction"
    t.integer  "item_type_id"
    t.integer  "price"
    t.integer  "price_fluctuation_rate"
    t.integer  "weight"
    t.integer  "quality"
    t.integer  "icon_number"
    t.integer  "field_item"
    t.integer  "equipping_sound_effect"
    t.integer  "crafting_id"
    t.integer  "crafting_level"
    t.integer  "crafting_material_id"
    t.integer  "crafting_difficulty"
    t.integer  "required_job_1_id"
    t.integer  "required_job_2_id"
    t.integer  "required_job_3_id"
    t.integer  "required_ability_1_id"
    t.integer  "required_ability_1_value"
    t.integer  "required_ability_2_id"
    t.integer  "required_ability_2_value"
    t.integer  "conditional_affiliations1"
    t.integer  "additional_ability_1_id"
    t.integer  "additional_ability_1_value"
    t.integer  "conditional_affiliations2"
    t.integer  "additional_ability_2_id"
    t.integer  "additional_ability_2_value"
    t.integer  "durability"
    t.integer  "accuracy"
    t.integer  "defense"
    t.integer  "magical_defense"
    t.integer  "material_type"
    t.integer  "name_prefix_id"
    t.integer  "product"
    t.integer  "refine"
    t.integer  "break"
    t.integer  "pvp_atk"
    t.integer  "pvp_def"
    t.integer  "pvm_atk"
    t.string   "model_attribute"
    t.integer  "item_set_id"
    t.string   "item_description"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "rose_languages", :force => true do |t|
    t.string  "token"
    t.integer "translation_column"
    t.string  "translation_id"
  end

  add_index "rose_languages", ["token"], :name => "index_rose_languages_on_token", :unique => true
  add_index "rose_languages", ["translation_column"], :name => "index_rose_languages_on_translation_column", :unique => true

  create_table "rose_quests", :force => true do |t|
    t.string   "name",            :default => "", :null => false
    t.integer  "time_limit"
    t.integer  "icon_number"
    t.string   "abandon_trigger"
    t.integer  "repeatable"
    t.integer  "daily_limit"
    t.string   "description_id"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "rose_status_effects", :force => true do |t|
    t.string   "subname",                            :default => "", :null => false
    t.string   "name",                               :default => "", :null => false
    t.integer  "effect_type"
    t.integer  "stackable"
    t.integer  "buff_type"
    t.integer  "removable"
    t.integer  "status_line_1"
    t.integer  "status_value_1"
    t.integer  "status_line_2"
    t.integer  "status_value_2"
    t.integer  "icon_number"
    t.integer  "effect"
    t.integer  "sound_effect"
    t.integer  "control1"
    t.integer  "control2"
    t.integer  "control3"
    t.integer  "ending_effect"
    t.integer  "ending_sound_effect"
    t.integer  "buff_type_depending_on_status_line"
    t.string   "effect_description"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  create_table "rose_translations_abilities", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "language_id"
    t.string   "translation"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rose_translations_abilities", ["language_id", "translation_id"], :name => "tlid", :unique => true

  create_table "rose_translations_descriptions", :force => true do |t|
    t.string   "translation_id"
    t.integer  "language_id"
    t.string   "translation"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rose_translations_descriptions", ["language_id", "translation_id"], :name => "tlid", :unique => true

  create_table "rose_translations_item_grades", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "language_id"
    t.string   "translation"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rose_translations_item_grades", ["language_id", "translation_id"], :name => "tlid", :unique => true

  create_table "rose_translations_item_prefixes", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "language_id"
    t.string   "translation"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rose_translations_item_prefixes", ["language_id", "translation_id"], :name => "tlid", :unique => true

  create_table "rose_translations_item_suffixes", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "language_id"
    t.string   "translation"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rose_translations_item_suffixes", ["language_id", "translation_id"], :name => "tlid", :unique => true

  create_table "rose_translations_item_types", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "language_id"
    t.string   "translation"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rose_translations_item_types", ["language_id", "translation_id"], :name => "tlid", :unique => true

  create_table "rose_translations_jobs", :force => true do |t|
    t.integer  "translation_id"
    t.integer  "language_id"
    t.string   "translation"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rose_translations_jobs", ["language_id", "translation_id"], :name => "tlid", :unique => true

  create_table "rose_translations_names", :force => true do |t|
    t.string   "translation_id"
    t.integer  "language_id"
    t.string   "translation"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "rose_translations_names", ["language_id", "translation_id"], :name => "tlid", :unique => true

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "role_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_roles", ["user_id", "role_id"], :name => "index_user_roles_on_user_id_and_role_id"

  create_table "users", :force => true do |t|
    t.string   "name",                   :default => "", :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "time_zone"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
