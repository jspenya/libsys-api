Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://livuery-management.herokuapp.com'

    resource '*',
      headers: :any,
      credentials: true,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
