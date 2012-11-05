# -*- coding: utf-8 -*-
require 'eventmachine'

class Tengine::Batch
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String

  # 0: sended, 1: send_failure, 2: starting, 3: starting_failure, 4: error, 5: success
  field :status_cd, type: Integer

  field :logs, type: Array

  EVENT_NAME_PREFIX = "tengine.batch."

  class << self
    def fire(batch_name, options = {}, &block)
      b = self.create!(name: batch_name, status_cd: 0,
        logs: ["#{Time.zone.now.rfc2822} sending the event to start"])
      begin
        properties = { batch_id: b.id, batch_name: batch_name }.update(options || {})
        EventMachine.run do
          Tengine::Event.fire :"#{EVENT_NAME_PREFIX}#{batch_name}", properties: properties
        end
      rescue Exception => e
        b.status_cd = 1
        b.logs << "#{Time.zone.now.rfc2822} [#{e.class.name}] #{e.message}\n  " << e.backtrace.join("\n  ")
        b.save!
        raise e
      end
    end

    def run(event)
      b = Tengine::Batch.find(event[:batch_id]) # 見つからなかった場合どうしよう？
      b.logs << "#{Time.zone.now.rfc2822} Starting"
      b.status_cd = 2
      b.save!
      begin
        yield(b) if block_given?
      rescue Exception => e
        b.logs << "#{Time.zone.now.rfc2822} [#{e.class.name}] #{e.message}\n  " << e.backtrace.join("\n  ")
        b.status_cd = 4
        b.save!
        raise e
      else
        b.status_cd = 5
        b.logs << "#{Time.zone.now.rfc2822} SUCCESS"
        b.save!
      end
    end
  end

  module Driveable
    extend ActiveSupport::Concern

    included do
      include Tengine::Core::Driveable
    end

    module ClassMethods
      def batch(batch_name)
        on "#{EVENT_NAME_PREFIX}#{batch_name}"
      end

    end
  end
end
