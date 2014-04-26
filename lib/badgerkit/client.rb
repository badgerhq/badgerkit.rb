module Badgerkit
  ##
  # Responsible for constructing a client which is able to post values.
  #
  class Client
    require 'httmultiparty'
    require 'hashie'

    attr_reader :path, :access_token, :source, :repo

    BASE_URI = 'http://badgerhq.com/'

    ##
    # Construct a new Badgekit::Client
    #
    # @param options [Hash]
    # @option token [String] :token
    # @option options [String] :source
    # @option options [String] :app
    # @option options [String] :name

    # @return [Badgerkit::Client]
    # @example
    #   Badgerkit::Client.new(
    #     :access_token => '0dbce1478e94053d4282ccd4ace154c82a3475d5',
    #     :source       => 'github',
    #     :repo         => 'saladdays-nl/badgerkit'
    #   )
    #
    #
    def initialize(options={})
      @access_token = ENV['BADGER_ACCESS_TOKEN'] || options[:access_token]
      @source       = ENV['BADGER_SOURCE']       || options[:source]
      @repo         = ENV['BADGER_REPO']         || options[:repo]
    end

    ##
    # Returns post path for badge.
    #
    # @param badge [String] the badge name
    # @return [String] escaped path
    #
    def path_for(badge)
      URI.escape("#{source}/#{repo}/#{badge}")
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
    #   client.post('Documentation',
    #     :value       => 80,
    #     :commit_sha1 => '0dbce1478e94053d4282ccd4ace154c82a3475d5',
    #     :branch      => 'master'
    #   )
    #
    def post(badge, attributes={})
      attributes = { :value => attributes, :access_token => access_token }
      response   = HTTMultiParty.post("#{BASE_URI}#{path_for(badge)}", :body => attributes).parsed_response
      response   = Hashie::Mash.new(response)
    end

  end # Client
end # Badgerkit
