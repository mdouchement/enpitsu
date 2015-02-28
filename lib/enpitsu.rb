require 'green_shoes'
require 'enpitsu/version'
require 'enpitsu/controller'
require 'enpitsu/view'

module Enpitsu
  Shoes.app(title: 'Enpitsu', width: 1280, height: 720) do
    Controller.new(stack)
  end
end
