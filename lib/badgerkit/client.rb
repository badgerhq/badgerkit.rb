module Badgerkit
  ##
  # Responsible for constructing a client which is able to post values.
  #
  class Client

    attr_reader :path, :source, :repo, :name

    BASE_URI = 'http://badgerhq.com/'

    ##
    # Construct a new Badgekit::Client
    #
    # @param options [Hash]
    # @option options [String] :source
    # @option options [String] :repo
    # @option options [String] :name
    # @return [Badgerkit::Client]
    # @example
    #   Badgerkit::Client.new(
    #     :source => 'github'
    #     :repo   => 'saladdays-nl/badgekit'
    #     :name   => 'Ruby documentation'
    #   )
    #
    #
    def initialize(options={})
      @source = options[:source]
      @repo   = options[:repo]
      @name   = options[:name]

      @path = URI.escape("#{source}/#{repo}/#{name}")
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
end # Badgerkit
