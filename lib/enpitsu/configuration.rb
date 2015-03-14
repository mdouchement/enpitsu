module Enpitsu
  class Configuration
    attr_accessor :logger

    def initialize
      @logger = Logger.new(STDOUT)
      @logger.level = Logger::INFO
    end
  end
end
