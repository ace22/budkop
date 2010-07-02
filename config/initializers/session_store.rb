# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_budkop_session',
  :secret      => '194306ffcc719738129e1da80285ab12d26e7088e695f120afd4915df69163ac66bbca0318669227f0f4875456a3c0dab66a31fda268abb15fa28c0a66b72262'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
