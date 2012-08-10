require 'guard'
require 'guard/guard'

module Guard
  class Mouch < Guard

    def initialize(watchers = [], options = {})
      super

      if options[:url] !~ /^https{0,1}:\/\//
      	raise "Please provide Guard::Mouch with a valid CouchDB server URL to push your app to."
      end
      @options = options
    end

    def start
      true
    end

    def stop
      true
    end

    def reload
      true
    end

    def run_all
      true
    end

    def run_on_change(paths)
      print "Mouch push..."
      mouch_file = @options[:mouch_cmd_file] || './mouch'
      config_file = @options[:mouch_config_file] || 'app.json.erb'
      url = @options[:url]
      system(mouch_file, config_file, url)
      puts "... DONE"
    end

  end
end
