encrypted_password = Devise::Encryptor.digest(User, 'password')

customers = [
  { name: "John Doe", email: "johndoe@example.com", encrypted_password: encrypted_password, phone_number: "1234567890", address: "1234 Sunset Blvd, Los Angeles, CA, USA", note: "VIP customer", customer_type: 0 },
  { name: "Jane Smith", email: "janesmith@example.com", encrypted_password: encrypted_password, phone_number: "0987654321", address: "5678 Oakwood Dr, Dallas, TX, USA", note: "Regular customer", customer_type: 1 },
  { name: "Alice Johnson", email: "alicejohnson@example.com", encrypted_password: encrypted_password, phone_number: "1122334455", address: "91011 Maple Ave, Seattle, WA, USA", note: "VIP customer", customer_type: 1 },
  { name: "Michael Brown", email: "michaelbrown@example.com", encrypted_password: encrypted_password, phone_number: "1234567891", address: "1213 Birch Ln, Denver, CO, USA", note: "VIP customer", customer_type: 0 },
  { name: "Emily Davis", email: "emilydavis@example.com", encrypted_password: encrypted_password, phone_number: "0987654322", address: "1415 Pinecrest Rd, Miami, FL, USA", note: "Regular customer", customer_type: 1 },
  { name: "James Wilson", email: "jameswilson@example.com", encrypted_password: encrypted_password, phone_number: "1122334456", address: "1617 Cedar St, Austin, TX, USA", note: "VIP customer", customer_type: 1 },
  { name: "Sophia Martinez", email: "sophiamartinez@example.com", encrypted_password: encrypted_password, phone_number: "2233445566", address: "1819 Elmwood St, Chicago, IL, USA", note: "Regular customer", customer_type: 0 },
  { name: "Benjamin Lee", email: "benjaminlee@example.com", encrypted_password: encrypted_password, phone_number: "3344556677", address: "2021 Willow Way, Boston, MA, USA", note: "VIP customer", customer_type: 0 },
  { name: "Olivia Harris", email: "oliviaharris@example.com", encrypted_password: encrypted_password, phone_number: "4455667788", address: "2223 River Rd, Portland, OR, USA", note: "Regular customer", customer_type: 1 },
  { name: "William Clark", email: "williamclark@example.com", encrypted_password: encrypted_password, phone_number: "5566778899", address: "2425 Redwood Blvd, San Francisco, CA, USA", note: "VIP customer", customer_type: 1 },
  { name: "Charlotte Lewis", email: "charlottelewis@example.com", encrypted_password: encrypted_password, phone_number: "6677889900", address: "1234 Sunset Blvd, Los Angeles, CA, USA", note: "Regular customer", customer_type: 0 },
  { name: "Daniel Walker", email: "danielwalker@example.com", encrypted_password: encrypted_password, phone_number: "7788990011", address: "5678 Oakwood Dr, Dallas, TX, USA", note: "VIP customer", customer_type: 1 },
  { name: "Grace Young", email: "graceyoung@example.com", encrypted_password: encrypted_password, phone_number: "8899001122", address: "91011 Maple Ave, Seattle, WA, USA", note: "Regular customer", customer_type: 0 },
  { name: "David King", email: "davidking@example.com", encrypted_password: encrypted_password, phone_number: "9900112233", address: "1213 Birch Ln, Denver, CO, USA", note: "VIP customer", customer_type: 0 },
  { name: "Ava Scott", email: "avascott@example.com", encrypted_password: encrypted_password, phone_number: "1122334457", address: "1415 Pinecrest Rd, Miami, FL, USA", note: "Regular customer", customer_type: 1 },
  { name: "Lucas Adams", email: "lucasadams@example.com", encrypted_password: encrypted_password, phone_number: "2233445567", address: "1617 Cedar St, Austin, TX, USA", note: "VIP customer", customer_type: 1 },
  { name: "Ella Thompson", email: "ellathompson@example.com", encrypted_password: encrypted_password, phone_number: "3344556678", address: "1819 Elmwood St, Chicago, IL, USA", note: "Regular customer", customer_type: 0 },
  { name: "Ethan White", email: "ethanwhite@example.com", encrypted_password: encrypted_password, phone_number: "4455667789", address: "2021 Willow Way, Boston, MA, USA", note: "VIP customer", customer_type: 1 },
  { name: "Isabella Harris", email: "isabellaharris@example.com", encrypted_password: encrypted_password, phone_number: "5566778890", address: "2223 River Rd, Portland, OR, USA", note: "Regular customer", customer_type: 0 },
  { name: "Jack Martinez", email: "jackmartinez@example.com", encrypted_password: encrypted_password, phone_number: "6677889901", address: "2425 Redwood Blvd, San Francisco, CA, USA", note: "VIP customer", customer_type: 1 },
  { name: "Mia Robinson", email: "miarobinson@example.com", encrypted_password: encrypted_password, phone_number: "7788990012", address: "1234 Sunset Blvd, Los Angeles, CA, USA", note: "Regular customer", customer_type: 1 }
]

customers.each do |customer|
  Customer.find_or_create_by!(customer)
end
