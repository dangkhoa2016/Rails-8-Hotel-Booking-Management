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

ActiveRecord::Schema[8.0].define(version: 2025_03_23_081904) do
  create_table "additional_services", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.float "price"
    t.string "unit"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "booking_additional_services", force: :cascade do |t|
    t.integer "additional_service_id"
    t.integer "reservation_id"
    t.string "note"
    t.integer "quantity"
    t.string "unit"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["additional_service_id"], name: "index_booking_additional_services_on_additional_service_id"
    t.index ["reservation_id"], name: "index_booking_additional_services_on_reservation_id"
  end

  create_table "booking_discounts", force: :cascade do |t|
    t.integer "booking_id"
    t.integer "discount_type"
    t.integer "discount_percent"
    t.float "discount_amount"
    t.integer "promotion_id"
    t.string "reason_for_discount"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_discounts_on_booking_id"
    t.index ["promotion_id"], name: "index_booking_discounts_on_promotion_id"
  end

  create_table "booking_vip_customer_discounts", force: :cascade do |t|
    t.integer "booking_id"
    t.integer "customer_id"
    t.integer "discount_type"
    t.integer "discount_percent_on_room_price"
    t.integer "discount_percent_on_additional_services"
    t.float "discount_amount_on_room_price"
    t.float "discount_amount_on_additional_services"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_booking_vip_customer_discounts_on_booking_id"
    t.index ["customer_id"], name: "index_booking_vip_customer_discounts_on_customer_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "status", default: 0
    t.float "total_price_before_discount"
    t.float "total_price"
    t.string "note"
    t.string "discount_note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email", null: false
    t.string "phone_number"
    t.string "address"
    t.string "note"
    t.integer "status", default: 1
    t.integer "customer_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_customers_on_email", unique: true
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities_rooms", id: false, force: :cascade do |t|
    t.integer "room_id"
    t.integer "facility_id"
    t.index ["facility_id"], name: "index_facilities_rooms_on_facility_id"
    t.index ["room_id"], name: "index_facilities_rooms_on_room_id"
  end

  create_table "hotel_locations", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "manager_name"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "booking_id"
    t.float "amount"
    t.datetime "payment_date"
    t.string "payment_method"
    t.string "payment_type"
    t.string "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_payments_on_booking_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.date "start_date"
    t.date "end_date"
    t.integer "discount_type"
    t.integer "discount_percent"
    t.float "discount_amount"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "room_id"
    t.integer "booking_id"
    t.datetime "check_in_at"
    t.datetime "check_out_at"
    t.integer "status", default: 0
    t.float "room_price"
    t.string "note"
    t.string "room_occupant"
    t.float "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reservations_on_booking_id"
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "room_id"
    t.integer "room_rating"
    t.integer "service_rating"
    t.text "comment"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
    t.index ["room_id"], name: "index_reviews_on_room_id"
  end

  create_table "room_types", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.string "color"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "name"
    t.integer "room_type_id"
    t.integer "hotel_location_id"
    t.integer "capacity"
    t.float "price"
    t.float "half_day_price_morning"
    t.float "half_day_price_afternoon"
    t.string "summary"
    t.boolean "available", default: true
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_location_id"], name: "index_rooms_on_hotel_location_id"
    t.index ["room_type_id"], name: "index_rooms_on_room_type_id"
  end

  create_table "special_requests", force: :cascade do |t|
    t.integer "reservation_id"
    t.string "request"
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_special_requests_on_reservation_id"
  end

  create_table "vip_customer_benefits", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "discount_type"
    t.integer "discount_percent_on_room_price"
    t.integer "discount_percent_on_additional_services"
    t.float "discount_amount_on_room_price"
    t.float "discount_amount_on_additional_services"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_vip_customers_benefits_on_customer_id"
  end
end
