require 'rack'
require 'pry'
class PersonalSite
  # class must have a call method that takes an argument env
  # the call method must have array that contains three components:
  # An HTTP status code
  # HTTP headers(generally providing some information about the response)
  # A message body(usually HTML, CSS, Javascript)
  def self.call(env)
    case env["PATH_INFO"]
    when '/' then index
    else
      error
    end
    # Recall, this array includes the HTTP response status code,
    # HTTP response headers and response body
  end

  def self.index
    ['200', {'Content-Type' => 'text/html'}, [File.read('./app/views/index.html')]]
  end

  def self.error
    ['404', {'Content-Type' => 'text/html'}, [File.read('./app/views/error.html')]]
  end
end
