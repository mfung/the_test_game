Dir[File.dirname(__FILE__) + '/../models/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each {|file| require file}