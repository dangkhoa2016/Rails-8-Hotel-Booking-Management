require_relative './us_names'
require_relative './us_addresses'
arr_addresses = Seeds::UsAddresses::LIST.shuffle

Seeds::UsNames::LIST.shuffle.each_with_index do |name, index|
  customer_type = rand(0..1) == 1 ? :vip : :normal
  created_at = Time.now - rand(1..1000).days

  customer = {
    name: name,
    email: "#{name.downcase.gsub(' ', '_')}@example.com",
    phone_number: "#{rand(100..999)}-#{rand(100..999)}-#{rand(1000..9999)}",
    address: arr_addresses[index],
    customer_type: customer_type,
    status: rand(10) > 3 ? :active : :inactive,
    created_at: created_at,
    updated_at: created_at.since(rand(100..10000).minutes)
  }

  if customer_type == :vip
    customer[:note] = "VIP customer on #{created_at.strftime('%Y-%m-%d')}"
  end

  Customer.find_or_create_by!(customer)
end
