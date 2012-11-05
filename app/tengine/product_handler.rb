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

Time.zone = ActiveSupport::TimeZone["Tokyo"]

class ProductHandler
  include Tengine::Batch::Driveable

  batch 'example1.on_create'
  def log_create_product
    Tengine::Batch.run(event) do
      cd = event[:product_code]
      if cd.to_s == /^\s\d+\s$/
        t = cd.to_s.to_i / 10
        10.times do |idx|
          puts "#{idx}/10"
          sleep(t)
        end
      end
      ProductLog.create!(msg: "product created")
    end
  end

  on 'tengine.example.on_update'
  def log_update_product
    Tengine::Batch.run(event) do
      ProductLog.create!(msg: "product updated")
    end
  end
end
