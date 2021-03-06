# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_27_023433) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hamburguesas", force: :cascade do |t|
    t.string "nombre"
    t.integer "precio"
    t.string "descripcion"
    t.string "imagen"
    t.text "ingredientes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hamburguesas_ingredientes", id: false, force: :cascade do |t|
    t.bigint "hamburguesa_id", null: false
    t.bigint "ingrediente_id", null: false
    t.index ["hamburguesa_id", "ingrediente_id"], name: "index_hambur_ingred"
    t.index ["ingrediente_id", "hamburguesa_id"], name: "index_ingred_hambur"
  end

  create_table "ingredientes", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "path"
  end

end
