# -*- coding: utf-8 -*-
require 'tengine_core'
require 'active_support/dependencies'

require File.expand_path('../../../config/application', __FILE__)

# ../../app/models を読めるように
pwd = File.dirname __FILE__
root = File.expand_path '../..', pwd
models = File.expand_path 'app/models', root
$:.unshift(models) unless $:.include?(models)
ActiveSupport::Dependencies.autoload_paths << models unless ActiveSupport::Dependencies.autoload_paths.include?(models)


class ProductHandler
  include Tengine::Core::Driveable

  on 'tengine.example.on_create'
  def log_create_product
    ProductLog.create!(msg: "product created")
  end

  on 'tengine.example.on_update'
  def log_update_product
    ProductLog.create!(msg: "product updated")
  end
end
