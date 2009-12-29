# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_as_paperclip_session',
  :secret      => 'fdc9cd5b5cb58d2561faa0d159490c1f7d71bde762b9ac8f09ea5b8a90e72e52c4df6182fec3779704eaadb2373d8781ba71ca54f2ca22cee2ea7b8d089145e4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
