require 'active_support/all'
require 'green_shoes'
require 'forwardable'
require 'enpitsu/version'
require 'enpitsu/controller'
require 'enpitsu/model'
require 'enpitsu/view'

module Enpitsu
  Shoes.app(title: "Enpitsu - #{VERSION}", width: 1280, height: 720) do
    Controller.new(stack)
  end
end
