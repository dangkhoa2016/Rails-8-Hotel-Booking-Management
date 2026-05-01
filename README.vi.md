# Rails 8 Hotel Booking Management

[![Ruby 3.4.1](https://img.shields.io/badge/Ruby-3.4.1-red?style=flat&logo=ruby&logoColor=white)](https://www.ruby-lang.org/)
[![Rails 8.1.3](https://img.shields.io/badge/Rails-8.1.3-CC0000?logo=rubyonrails&logoColor=white)](https://rubyonrails.org/)
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/dangkhoa2016/Rails-8-Hotel-Booking-Management/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/dangkhoa2016/Rails-8-Hotel-Booking-Management/tree/main)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> 🌐 Language / Ngôn ngữ: [English](README.md) | **Tiếng Việt**

`Rails 8 Hotel Booking Management` là ứng dụng Rails 8 để quản lý vận hành khách sạn, gồm một trang chủ công khai và một khu vực back-office yêu cầu đăng nhập. Hệ thống bao phủ các nghiệp vụ cốt lõi như địa điểm khách sạn, phòng, loại phòng, khách hàng, booking, reservation, thanh toán, khuyến mãi, ưu đãi VIP, đánh giá, dịch vụ bổ sung và người dùng nội bộ.

## Tính năng chính

- Trang chủ công khai tại `/` với phần giới thiệu dịch vụ và liên hệ.
- Đăng nhập, đăng ký, quên mật khẩu và quản lý hồ sơ người dùng bằng Devise.
- Dashboard tại `/dashboard` sau khi đăng nhập, hiển thị số bản ghi theo từng bảng dữ liệu.
- CRUD cho các module `customers`, `vip_customer_benefits`, `room_types`, `rooms`, `hotel_locations`, `facilities`, `additional_services`, `bookings`, `reservations`, `special_requests`, `booking_discounts`, `payments`, `promotions`, `reviews` và `users`.
- Phân quyền theo vai trò với Pundit, sử dụng các role `normal`, `manager` và `admin`.
- Tự động tính lại tổng tiền booking từ reservation, dịch vụ bổ sung, discount và ưu đãi VIP.
- Hỗ trợ chuyển ngôn ngữ `en` và `vi` bằng cookie.
- Hỗ trợ theme `light`, `dark`, `auto` bằng Stimulus và `localStorage`.
- Giao diện quản trị responsive với Bootstrap 5.
- Phân trang bằng Pagy.

## Công nghệ sử dụng

- Ruby `3.4.1` theo [.ruby-version](.ruby-version)
- Rails `8.1.3`
- SQLite cho development/test, và production dùng các SQLite database tách riêng cho primary/cache/queue/cable
- Hotwire: Turbo + Stimulus
- Importmap + Propshaft, không cần pipeline build frontend bằng Node để chạy app
- Bootstrap `5.3.3` và Bootstrap Icons
- Devise cho authentication
- Pundit cho authorization
- Pagy cho pagination
- Solid Cache, Solid Queue và Solid Cable
- Minitest, Capybara và Selenium cho test tự động
- Brakeman, RuboCop và `bin/importmap audit` trong CI

## Tổng quan mô hình nghiệp vụ

- `Customer`: hồ sơ khách hàng, loại khách hàng và trạng thái
- `VipCustomerBenefit`: quy tắc giảm giá VIP theo phần trăm hoặc số tiền cố định
- `RoomType`, `Room`, `Facility`, `HotelLocation`: danh mục phòng và hạ tầng khách sạn
- `Booking`: booking tổng, liên kết tới customer, reservations, discounts và payments
- `Reservation`: lượt ở thực tế với dữ liệu check-in/check-out và giá phòng
- `AdditionalService` và `BookingAdditionalService`: dịch vụ phát sinh gắn với reservation
- `Promotion` và `BookingDiscount`: chương trình khuyến mãi và discount áp dụng cho booking
- `Payment`: thanh toán một lần, trả góp hoặc subscription
- `Review`: đánh giá của khách hàng về phòng và dịch vụ
- `User`: tài khoản nội bộ với role và status

## Yêu cầu môi trường

- Ruby `3.4.1`
- Bundler
- SQLite3
- Git
- `build-essential`, `libyaml-dev` và `pkg-config` trên Linux nếu cần biên dịch gem native
- Google Chrome hoặc Chromium nếu chạy system test

## Thiết lập nhanh

1. Cài dependencies:

```bash
bundle install
```

2. Có thể copy file môi trường mẫu nếu muốn dùng sẵn cấu hình port và logging:

```bash
cp .env.sample .env
```

3. Chuẩn bị database:

```bash
bin/setup --skip-server
```

4. Chạy ứng dụng:

```bash
bin/rails server
```

Hoặc dùng:

```bash
bin/setup
```

`bin/setup` sẽ cài gem, chạy `db:prepare`, dọn log/tmp và khởi động server.

## Truy cập ứng dụng

- Nếu dùng `.env.sample`, app chạy ở `http://localhost:4000`
- Nếu không dùng `.env`, Rails mặc định chạy ở `http://localhost:3000`
- Trang công khai: `/`
- Dashboard sau đăng nhập: `/dashboard`
- Hồ sơ người dùng: `/user/profile`

## Tài khoản mẫu và seed data

File [db/seeds/users.rb](db/seeds/users.rb) định nghĩa sẵn các tài khoản development sau:

- Admin: `admin@admin.admin` / `adminadmin`
- Manager: `manager1@example.com` / `password`
- Manager: `manager2@example.com` / `password`
- User thường: `user1@example.com` đến `user5@example.com` / `password`

Ngoài môi trường development, admin credentials được lấy từ:

- `ADMIN_EMAIL`
- `ADMIN_PASSWORD`
- hoặc Rails credentials `admin_email` / `admin_password`

Để seed toàn bộ dữ liệu:

```bash
bin/rails db:seed
```

Luồng seed hiện tại đã được xác nhận chạy xong sau khi sửa drift schema trong seed promotions và room types.

## Kiểm thử và kiểm tra chất lượng

Chạy unit và integration tests:

```bash
bin/rails test
```

Chạy system tests:

```bash
bin/rails test:system
```

Chạy đúng lệnh test như trong CI:

```bash
RAILS_ENV=test bin/rails db:test:prepare test test:system
```

Chạy lint và security checks:

```bash
bin/rubocop
bin/brakeman --no-pager
bin/importmap audit
```

CI hiện chạy bốn nhóm kiểm tra chính:

- Brakeman
- Importmap audit
- RuboCop
- Rails tests cùng system tests

Nếu system test fail trên GitHub Actions, workflow sẽ upload ảnh chụp màn hình từ `tmp/screenshots`.

## Giao diện và trải nghiệm người dùng

- Sidebar quản trị cố định bên trái cho khu vực back-office
- Dashboard hỗ trợ light và dark theme
- Locale switcher cho `en` và `vi` ở cả landing page và khu vực quản trị
- Theme switcher áp dụng `data-bs-theme` trên phần tử HTML gốc
- Ứng dụng chỉ cho phép modern browsers thông qua `allow_browser versions: :modern`

## Thư mục quan trọng

- [app/models](app/models): domain models và business rules
- [app/controllers](app/controllers): controller cho landing page, dashboard và các CRUD resources
- [db/seeds](db/seeds): dữ liệu mẫu chia theo từng domain
- [test](test): Minitest, fixtures và system tests
- [screenshots](screenshots): danh mục ảnh chụp giao diện
- [screenshots/README.md](screenshots/README.md): tài liệu ảnh chụp đã được phân loại

## Lưu ý hiện trạng

- [Dockerfile](Dockerfile) vẫn đang đặt `ARG RUBY_VERSION=3.2.7`, trong khi [.ruby-version](.ruby-version) là `3.4.1`. Nên đồng bộ lại trước khi build image production.

## Triển khai

- Repo đã có [Dockerfile](Dockerfile) cho production image.
- `kamal` và `thruster` đã có trong dependency tree để phục vụ cách triển khai kiểu Rails 8.
- Production hiện vẫn mặc định dùng SQLite dưới thư mục `storage/`.

## Tài liệu liên quan

- Danh mục ảnh chụp giao diện: [screenshots/README.md](screenshots/README.md)
- Tài liệu tiếng Anh: [README.md](README.md)

## License

Hiện README chưa khai báo license riêng cho dự án.
