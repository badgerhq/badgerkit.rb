module Badgekit
  ##
  # Responsible for constructing a client which is able to post values.
  #
  class Client

    attr_reader :path

    BASE_URI = 'http://badgerhq.com/'

    ##
    # Construct a new Badgekit::Client
    #
    # @param source [String]
    # @param user [String]
    # @param name [String]
    # @return [Badgekit::Client]
    # @example
    #   Badgekit::Client.new('github', 'saladdays-nl', 'badgekit')
    #
    def initialize(source, user, name, badge)
      @path = URI.escape("#{source}/#{user}/#{name}/#{badge}")
    end

    ##
    # Post a value.
    #
    # @param attributes [Hash]
    # @option attributes [String, Integer, Float] :value
    # @option attributes [String] :commit_sha1
    # @option attributes [String] :branch
    #
    # @example
    #   client = Badgekit::Client.new('github', 'saladdays-nl', 'badgekit')
    #   client.post(
    #     :value       => 80,
    #     :commit_sha1 => '0dbce1478e94053d4282ccd4ace154c82a3475d5',
    #     :branch      => 'master'
    #   )
    #
    def post(attributes={})
      attributes = { :value => attributes }
      response   = HTTParty.post("#{BASE_URI}#{path}", :body => attributes).parsed_response
      response   = Hashie::Mash.new(response)
    end

  end # Client
end # Badgekit
