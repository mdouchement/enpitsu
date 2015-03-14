require 'active_support/all'
require 'enpitsu/core_ext/green_shoes' if require 'green_shoes'
require 'forwardable'
require 'observer'
require 'enpitsu/version'
require 'enpitsu/configuration'
require 'enpitsu/controller'
require 'enpitsu/model'
require 'enpitsu/view'

module Enpitsu
  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.logger
    configuration.logger
  end

  def self.pwd
    File.dirname(File.expand_path(__FILE__))
  end

  Shoes.app(title: "Enpitsu - #{VERSION}", width: 1280, height: 720) do
    Controller.new(stack)
  end
end
