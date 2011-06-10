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

ActiveRecord::Schema.define(:version => 20110531234257) do

  create_table "aspects", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "cases", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "genders", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "languages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
    t.string   "url"
    t.text     "blurb"
  end

  add_index "languages", ["cached_slug"], :name => "index_languages_on_cached_slug", :unique => true

  create_table "lexeme_phrases", :force => true do |t|
    t.integer  "position"
    t.integer  "phrase_id"
    t.integer  "lexeme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lexeme_phrases", ["lexeme_id"], :name => "index_lexeme_memberships_on_lexeme_id"
  add_index "lexeme_phrases", ["phrase_id"], :name => "index_lexeme_memberships_on_phrase_id"
  add_index "lexeme_phrases", ["position"], :name => "index_lexeme_memberships_on_position"

  create_table "lexemes", :force => true do |t|
    t.string   "free_translation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
    t.text     "notes"
    t.integer  "pos_id"
    t.integer  "tense_id"
    t.integer  "aspect_id"
    t.integer  "mood_id"
    t.integer  "voice_id"
    t.integer  "person_id"
    t.integer  "number_id"
    t.integer  "gender_id"
    t.integer  "case_id"
  end

  add_index "lexemes", ["aspect_id"], :name => "index_lexemes_on_aspect_id"
  add_index "lexemes", ["case_id"], :name => "index_lexemes_on_case_id"
  add_index "lexemes", ["gender_id"], :name => "index_lexemes_on_gender_id"
  add_index "lexemes", ["language_id"], :name => "index_lexemes_on_language_id"
  add_index "lexemes", ["mood_id"], :name => "index_lexemes_on_mood_id"
  add_index "lexemes", ["number_id"], :name => "index_lexemes_on_number_id"
  add_index "lexemes", ["person_id"], :name => "index_lexemes_on_person_id"
  add_index "lexemes", ["pos_id"], :name => "index_lexemes_on_pos_id"
  add_index "lexemes", ["tense_id"], :name => "index_lexemes_on_tense_id"
  add_index "lexemes", ["voice_id"], :name => "index_lexemes_on_voice_id"

  create_table "moods", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "morpheme_lexemes", :force => true do |t|
    t.integer  "position"
    t.integer  "morpheme_id"
    t.integer  "lexeme_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "morpheme_lexemes", ["lexeme_id"], :name => "index_morpheme_lexemes_on_lexeme_id"
  add_index "morpheme_lexemes", ["morpheme_id"], :name => "index_morpheme_lexemes_on_morpheme_id"
  add_index "morpheme_lexemes", ["position"], :name => "index_morpheme_lexemes_on_position"

  create_table "morphemes", :force => true do |t|
    t.integer  "language_id"
    t.string   "orthography"
    t.string   "gloss"
    t.string   "translation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "lexical_entry"
  end

  add_index "morphemes", ["gloss"], :name => "index_morphemes_on_gloss"
  add_index "morphemes", ["language_id"], :name => "index_morphemes_on_language_id"
  add_index "morphemes", ["lexical_entry"], :name => "index_morphemes_on_lexical_entry"
  add_index "morphemes", ["orthography"], :name => "index_morphemes_on_orthography"
  add_index "morphemes", ["translation"], :name => "index_morphemes_on_translation"

  create_table "numbers", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "people", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "phrase_stories", :force => true do |t|
    t.integer  "position"
    t.integer  "phrase_id"
    t.integer  "story_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phrase_stories", ["phrase_id"], :name => "index_phrases_stories_on_phrase_id"
  add_index "phrase_stories", ["position"], :name => "index_phrases_stories_on_position"
  add_index "phrase_stories", ["story_id"], :name => "index_phrases_stories_on_story_id"

  create_table "phrases", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
    t.string   "judgment"
    t.string   "free_translation"
  end

  add_index "phrases", ["language_id"], :name => "index_phrases_on_language_id"

  create_table "pos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "stories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
    t.string   "name"
  end

  add_index "stories", ["language_id"], :name => "index_stories_on_language_id"

  create_table "tenses", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "language_id"
    t.boolean  "is_admin"
  end

  add_index "users", ["language_id"], :name => "index_users_on_language_id"

  create_table "voices", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
  end

end
