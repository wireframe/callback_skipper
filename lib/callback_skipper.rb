require "callback_skipper/version"

module CallbackSkipper
  extend ActiveSupport::Concern
  module InstanceMethods
    def skip_callback(*args)
      instance = self
      args << {:if => lambda { self == instance }}
      self.class.skip_callback *args
    end
  end
end
ActiveRecord::Base.send :include, CallbackSkipper
