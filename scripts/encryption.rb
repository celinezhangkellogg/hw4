# 1. encrypt a secret and puts encrypted string
secret = "puppies"
encrypted = BCrypt::Password.create(secret)
puts encrypted
# 2. prepare encrypted string for testing
entered_password = "puppies"
outcome = BCrypt::Password.new(encrypted) == entered_password
# 3. test secret against prepared encrypted string
puts outcome
