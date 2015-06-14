Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV['git_key'], ENV['git_secret_key']
end
