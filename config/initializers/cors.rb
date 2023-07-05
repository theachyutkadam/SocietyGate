# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins "*"

#     resource "*",
#              headers: :any,
#              methods: %i[get post put patch delete options head]
#   end
# end

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins [
      "http://127.0.0.1:4200",
      "http://127.0.0.1:1025",
      "http://localhost:4200",
      "http://localhost:1025",
      "http://10.71.23.106:8000",
      "http://localhost:8000",
      "http://localhost:5173"
    ]
    resource "*", headers: :any, methods: %i[get post patch put delete options]
  end
end