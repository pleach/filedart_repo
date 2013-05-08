class Dart < ActiveRecord::Base
  attr_accessible :name, :percentage, :size, :url, :token, :completed
  
  before_create :generate_token
  
  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64
      break random_token unless Dart.where(token: random_token).exists?
    end
  end
    
    
end
