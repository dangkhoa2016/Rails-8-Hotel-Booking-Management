
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
