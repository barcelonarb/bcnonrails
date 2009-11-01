# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bcnonrails_session',
  :secret      => '03be57122f42b9e2a33aea4d23d41a48454854a74ae51485f87910e2704deee3cfff5ecc1e3819d8e6ba09ec23dd7776b5a0ddaa97b539ec2134d049ee203ab7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
