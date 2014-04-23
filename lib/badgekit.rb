require "badgekit/version"
require "badgekit/client"

module Badgekit

  ### Class methods

  class << self

    # Alias for Badgekit::Client.new
    #
    # @return [Badgekit::Client.]
    #
    def new(options={})
      @options = options
      Badgekit::Client.new(options)
    end

  end # class << self

end # Badgekit
