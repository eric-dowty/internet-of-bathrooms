module OmniAuthUser

  def self.mock_omniauth_user
    auth = OmniAuth::AuthHash.new({ 
                  'provider' => 'github',
                  'uid' => '12345',
                  'info' => {
                      'name' => 'eric',
                      'email' => 'eric@gmail.com',
                      'nickname' => 'e
                      diddy'
                  },
                  'extra' => {'raw_info' =>
                                  { 'location' => 'Denver',
                                    'gravatar_id' => '123456789'
                                  }
                  }
    })
    # OmniAuth.config.mock_auth[:github] = auth
    # OmniAuth.config.mock_auth[:default] = auth
  end

end