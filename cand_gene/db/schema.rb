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

ActiveRecord::Schema.define(:version => 20120331132146) do

  create_table "features", :force => true do |t|
    t.text     "comment"
    t.integer  "rating"
    t.integer  "pubmed"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "gene_id"
    t.integer  "topic_id"
  end

  add_index "features", ["gene_id", "topic_id"], :name => "i_gene_topic"

  create_table "genes", :force => true do |t|
    t.string   "symbol"
    t.string   "long_name"
    t.text     "summary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
