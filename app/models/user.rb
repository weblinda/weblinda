class User < ActiveRecord::Base
    
  belongs_to :language
  
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
    c.crypto_provider.cost = 10 # AuthLogic handles transparently, change as server changes
  end
  
end
