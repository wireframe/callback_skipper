require "callback_skipper/version"

module CallbackSkipper
  extend ActiveSupport::Concern
  def skip_callback(*args)
    instance = self
    args << {:if => lambda { self == instance }}
    self.class.skip_callback *args
  end
end
ActiveRecord::Base.send :include, CallbackSkipper
