require "callback_skipper/version"

module CallbackSkipper
  extend ActiveSupport::Concern

  class CallbackMethodNotDefined < ActiveRecord::ActiveRecordError ;end

  def skip_callback(*args)
    # skip over callback name and/or type
    filters_start_index = args[1].in?([:before, :after, :around]) ? 2 : 1
    # skip over callback options
    filters_end_index = args.last.is_a?(Hash) ? -2 : -1
    args[filters_start_index..filters_end_index].each do |callback_method|
      raise CallbackMethodNotDefined unless self.class.method_defined? callback_method
    end
    instance = self
    args << {:if => lambda { self == instance }}
    self.class.skip_callback *args
  end
end

ActiveRecord::Base.send :include, CallbackSkipper
