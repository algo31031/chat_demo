# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_chat_demo_session',
  :secret      => '9c34412e755df0b384875031f7639423e77de12e2c1745c6569849d2e43f5348f1116526f2bbcf884f22846751c5a013c48d8dcfe1aa9c7dd2f33c6c34e8364a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
