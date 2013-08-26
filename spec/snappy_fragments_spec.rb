require "spec_helper"

class Cache
  def initialize
    @fake_cache = {}
  end

  def read(key)
    @fake_cache[key]
  end

  def write(key, options, value)
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
    
  end
end

describe SnappyFragments::ViewHelpers do 
  before :all do
    ActionView::Base.send(:include,SnappyFragments::ViewHelpers)
    @view_context = ActionView::Base.new
  end

  it "supports the snappy_fragment method" do
    expect { 
      @view_context.snappy_fragment("key", {:expires_in => 5 * 60}) do
        "test"
      end
    }.not_to raise_error(Exception)
  end

  it "can store a fragment" do 
    @view_context.snappy_fragment("content_test", {:expires_in => 5 * 60}) do
      "fragment should be this"
    end

    fragment = @view_context.snappy_fragment("content_test", {:expires_in => 5 * 60}) do
      "fragment should not be this"
    end
    
    fragment.should == "fragment should be this"
  end

  it "evaluates utf-8 chars correctly" do 
    @view_context.snappy_fragment("utf-8-fragment", {:expires_in => 5 * 60}) do
      "fragment should be this æøå"
    end

    fragment = @view_context.snappy_fragment("utf-8-fragment", {:expires_in => 5 * 60}) do
      "fragment should not be this"
    end
    
    fragment.should == "fragment should be this æøå"
  end  

  
end