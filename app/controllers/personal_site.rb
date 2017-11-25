require 'rack'
require 'pry'
class PersonalSite
  def self.call(env)
    binding.pry
    ['200', {'Content-Type' => 'text/html'}, ['Welcome!']] #Recall, this array includes the HTTP response
  end
end
