require 'active_support/all'
require 'enpitsu/core_ext/green_shoes' if require 'green_shoes'
require 'forwardable'
require 'observer'
require 'enpitsu/version'
require 'enpitsu/controller'
require 'enpitsu/model'
require 'enpitsu/view'

module Enpitsu
  Shoes.app(title: "Enpitsu - #{VERSION}", width: 1280, height: 720) do
    Controller.new(stack)
  end
end
