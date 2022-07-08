module RedisUi
  class ConfigsController < ApplicationController
    def show
      @instance = RedisUi.config.redis_instances.detect { |obj| params[:id].to_s == obj.id.to_s }

      raise "Missing instance for params: #{params.inspect}. Options are: #{RedisUi.config.redis_instances.map(&:id)}" if @instance.nil?

      @redis = Redis.new(url: @instance.url(unredacted: true))
    end
  end
end
