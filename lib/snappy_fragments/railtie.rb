require "snappy_fragments/view_helpers"

module SnappyFragments
	class Railtie < Rails::Railtie
    initializer "snappy_fragments.view_helpers" do 
      ActionView::Base.send(:include, ViewHelpers)
    end
  end
end