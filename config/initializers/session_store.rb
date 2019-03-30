# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_url_shortener_session',
  :secret      => '4dd5d6445cb9c55b62e7494b14c30ec99b6d2639ba03c8d9358efb402accbea8ca91b181c8c6ec28522ccb8775d63d70e5549c0624e58bae9524c9e85fa8523a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
