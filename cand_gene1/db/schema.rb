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

ActiveRecord::Schema.define(:version => 20120529143002) do

  create_table "aliases", :force => true do |t|
    t.integer  "gene_id"
    t.string   "gene_alias"
    t.string   "source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "feature_versions", :force => true do |t|
    t.integer  "feature_id"
    t.integer  "version"
    t.integer  "gene_id"
    t.integer  "topic_id"
    t.string   "url"
    t.integer  "pubmed"
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    :default => 0
    t.string   "author",     :default => "", :null => false
  end

  add_index "feature_versions", ["feature_id"], :name => "index_feature_versions_on_feature_id"

  create_table "features", :force => true do |t|
    t.integer  "gene_id"
    t.integer  "topic_id"
    t.string   "url"
    t.integer  "pubmed"
    t.text     "comment"
    t.integer  "rating"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id",    :default => 0,  :null => false
    t.integer  "version"
    t.string   "author",     :default => "", :null => false
  end

  add_index "features", ["gene_id", "topic_id"], :name => "i_gene_topic"

  create_table "gene_versions", :force => true do |t|
    t.integer  "gene_id"
    t.integer  "version"
    t.string   "symbol"
    t.string   "long_name"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    :default => 0
  end

  add_index "gene_versions", ["gene_id"], :name => "index_gene_versions_on_gene_id"

  create_table "genes", :force => true do |t|
    t.string   "symbol"
    t.string   "long_name"
    t.text     "summary"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "user_id",    :default => 0,  :null => false
    t.integer  "version"
    t.string   "disease",    :default => "", :null => false
  end

  add_index "genes", ["symbol"], :name => "iu_genesymbol", :unique => true

  create_table "topic_versions", :force => true do |t|
    t.integer  "topic_id"
    t.integer  "version"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "display_order", :default => 0, :null => false
  end

  add_index "topic_versions", ["topic_id"], :name => "index_topic_versions_on_topic_id"

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "version"
    t.integer  "display_order", :default => 0, :null => false
  end

  add_index "topics", ["name"], :name => "iu_topicname", :unique => true

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "fullname"
    t.boolean  "is_admin"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["username"], :name => "iu_username", :unique => true

  create_table "variant_versions", :force => true do |t|
    t.integer  "variant_id"
    t.integer  "version"
    t.integer  "gene_id"
    t.string   "key"
    t.string   "function"
    t.string   "interest"
    t.string   "nmi"
    t.string   "dbsnp"
    t.float    "freq"
    t.float    "freq_finn"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "variant_versions", ["variant_id"], :name => "index_variant_versions_on_variant_id"

  create_table "variants", :force => true do |t|
    t.integer  "gene_id"
    t.string   "key"
    t.string   "function"
    t.string   "interest"
    t.string   "nmi"
    t.string   "dbsnp"
    t.float    "freq"
    t.float    "freq_finn"
    t.string   "source"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "version"
    t.integer  "validated",  :default => 0, :null => false
  end

end
