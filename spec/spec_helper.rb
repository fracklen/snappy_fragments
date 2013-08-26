require 'snappy_fragments'
require "active_support/core_ext/object"

class Cache
  def initialize
    @fake_cache = {}
  end

  def read(key, **args)
    @fake_cache[key]
  end

  def write(key, value, options)
    @fake_cache[key] = value
  end
end

module Rails
  def self.cache
    @cache_client ||= Cache.new
  end
end

module ActionView
  class Base
    def capture(&block)
      yield
    end

    def controller
      OpenStruct.new(:perform_caching => true)
    end
  end
end

class String
  def html_safe
    self
  end
end
