class Init < ActiveRecord::Migration[8.0]
  def change
    # Customers table
    create_table :customers do |t|
      t.string :name
      t.string :email, null: false
      t.string :phone_number
      t.string :address
      t.string :note
      t.integer :status, default: 1
      t.integer :customer_type, default: 0
      t.timestamps null: false
    end
    add_index :customers, :email, unique: true

    # Vip Customer Benefits table
    create_table :vip_customer_benefits do |t|
      t.integer :customer_id
      t.integer :discount_type
      t.integer :discount_percent_on_room_price
      t.integer :discount_percent_on_additional_services
      t.float :discount_amount_on_room_price
      t.float :discount_amount_on_additional_services
      t.integer :status, default: 1
      t.timestamps null: false
    end
    add_index :vip_customer_benefits, :customer_id

    # Room Types table
    create_table :room_types do |t|
      t.string :name
      t.text :description
      t.string :color
      t.integer :status, default: 1
      t.timestamps null: false
    end

    # Hotel Locations table
    create_table :hotel_locations do |t|
      t.string :name
      t.string :address
      t.string :manager_name
      t.integer :status, default: 1
      t.timestamps null: false
    end

    # Rooms table
    create_table :rooms do |t|
      t.string :name
      t.integer :room_type_id
      t.integer :hotel_location_id
      t.integer :capacity
      t.float :price
      t.float :half_day_price_morning
      t.float :half_day_price_afternoon
      t.text :summary
      t.boolean :available, default: true
      t.integer :status, default: 1
      t.timestamps null: false
    end
    add_index :rooms, :hotel_location_id
    add_index :rooms, :room_type_id

    # Reservations table
    create_table :reservations do |t|
      t.integer :room_id
      t.integer :booking_id
      t.datetime :check_in_at
      t.datetime :check_out_at
      t.integer :quantity
      t.integer :status, default: 0
      t.float :room_price
      t.string :note
      t.string :room_occupant
      t.float :total_price
      t.timestamps null: false
    end
    add_index :reservations, :booking_id
    add_index :reservations, :room_id

    # Bookings table
    create_table :bookings do |t|
      t.integer :customer_id
      t.integer :status, default: 0
      t.float :total_price_before_discount
      t.float :total_price
      t.string :note
      t.string :discount_note
      t.timestamps null: false
    end
    add_index :bookings, :customer_id

    # Special Requests table
    create_table :special_requests do |t|
      t.integer :reservation_id
      t.string :request
      t.float :price
      t.timestamps null: false
    end
    add_index :special_requests, :reservation_id

    # Booking Discounts table
    create_table :booking_discounts do |t|
      t.integer :booking_id
      t.integer :discount_type
      t.integer :discount_percent
      t.float :discount_amount
      t.integer :promotion_id
      t.string :reason_for_discount
      t.string :note
      t.timestamps null: false
    end
    add_index :booking_discounts, :booking_id
    add_index :booking_discounts, :promotion_id

    create_table :booking_vip_customer_discounts do |t|
      t.integer :booking_id
      t.integer :customer_id
      t.integer :discount_type
      t.integer :discount_percent_on_room_price
      t.integer :discount_percent_on_additional_services
      t.float :discount_amount_on_room_price
      t.float :discount_amount_on_additional_services
      t.timestamps null: false
    end
    add_index :booking_vip_customer_discounts, :booking_id
    add_index :booking_vip_customer_discounts, :customer_id

    # Promotions table
    create_table :promotions do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.date :end_date
      t.integer :discount_type
      t.integer :discount_percent
      t.float :discount_amount
      t.integer :status, default: 1
      t.timestamps null: false
    end

    # Additional Services table
    create_table :additional_services do |t|
      t.string :name
      t.string :summary
      t.float :price
      t.string :unit
      t.integer :status, default: 1
      t.timestamps null: false
    end

    # Booking Additional Services table
    create_table :booking_additional_services do |t|
      t.integer :additional_service_id
      t.integer :reservation_id
      t.string :note
      t.integer :quantity
      t.string :unit
      t.float :total_price
      t.timestamps null: false
    end
    add_index :booking_additional_services, :additional_service_id

    # Payments table
    create_table :payments do |t|
      t.integer :booking_id
      t.float :amount
      t.datetime :payment_date
      t.string :payment_method
      t.string :payment_type
      t.string :note
      t.timestamps null: false
    end
    add_index :payments, :booking_id

    # Reviews table
    create_table :reviews do |t|
      t.integer :customer_id
      t.integer :room_id
      t.integer :room_rating
      t.integer :service_rating
      t.text :comment
      t.integer :status, default: 1
      t.timestamps null: false
    end
    add_index :reviews, :customer_id
    add_index :reviews, :room_id

    # Facilities table
    create_table :facilities do |t|
      t.string :name
      t.string :summary
      t.integer :status, default: 1
      t.timestamps null: false
    end

    # Facilities Rooms table (join table)
    create_table :facilities_rooms, id: false do |t|
      t.integer :room_id
      t.integer :facility_id
    end

    add_index :facilities_rooms, :facility_id
    add_index :facilities_rooms, :room_id
  end
end
