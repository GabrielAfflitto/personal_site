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
    when '/about' then about
    when '/main.css' then css
    else
      error
    end
  end


  def self.css
    render_static('main.css')
  end

  def self.render_static(asset)
    ['200', {'Content-Type' => 'text/html'}, [File.read("./public/#{asset}")]]
  end

  def self.index
    render_view('index.html')
  end

  def self.about
    render_view('about.html')
  end

  def self.error
    render_view('error.html', '404')
  end

  def self.render_view(page, code = '200')
    [code, {'Content-Type' => 'text/html'}, [File.read("./app/views/#{page}")]]
  end

end
