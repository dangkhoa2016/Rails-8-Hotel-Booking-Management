
def get_email
  return 'admin@admin.admin' if Rails.env.development?

  if ENV['ADMIN_EMAIL'].present?
    puts "Loaded admin email from environment variables"
    ENV['ADMIN_EMAIL']
  elsif Rails.application.credentials.admin_email.present?
    puts "Loaded admin email from config/credentials.yml.enc or config/credentials/#{Rails.env}.yml.enc"
    Rails.application.credentials.admin_email
  end
end

def get_password
  return 'adminadmin' if Rails.env.development?

  if ENV['ADMIN_PASSWORD'].present?
    puts "Loaded admin password from environment variables"
    ENV['ADMIN_PASSWORD']
  elsif Rails.application.credentials.admin_password.present?
    puts "Loaded admin password from config/credentials.yml.enc or config/credentials/#{Rails.env}.yml.enc"
    Rails.application.credentials.admin_password
  end
end

email = get_email
password = get_password

if email && password
  user = User.find_or_create_by(
    email: email,
  )

  user.full_name = 'Admin Admin'
  user.role = :admin
  user.password = password
  user.save!

  puts "Admin user created at #{Time.now} using provided credentials in environment variables or " +
    "config/credentials.yml.enc or config/credentials/#{Rails.env}.yml.enc"
else
  puts %Q(
    Can't create admin user.
    Please provide either the ADMIN_EMAIL environment variable or
    config/credentials.yml.enc or config/credentials/#{Rails.env}.yml.enc
    with :admin_email,
    and either the ADMIN_PASSWORD environment variable or
    config/credentials.yml.enc or config/credentials/#{Rails.env}.yml.enc
    with :admin_password.
  )
end

# add some normal users
5.times do
  User.create!(
    email: "user#{rand(1000..9999)}@example.com",
    password: 'password',
    role: :normal,
    full_name: "User #{rand(1000..9999)}",
  )
end

puts "5 normal users created at #{Time.now}"

# add some manager users
2.times do
  User.create!(
    email: "admin#{rand(1000..9999)}@example.com",
    password: 'password',
    role: :manager,
    full_name: "Manager #{rand(1000..9999)}",
  )
end
