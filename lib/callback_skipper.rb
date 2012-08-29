require "callback_skipper/version"

module CallbackSkipper
  extend ActiveSupport::Concern

  class CallbackNotDefinedError < StandardError; end

  # skip a specific callback for the given instance
  # @raises CallbackNotDefinedError if no callback is found matching the requested callback
  def skip_callback(*args)
    raise CallbackNotDefinedError.new("Callback not defined matching: #{self.class.name} #{args}") unless callback_defined?(*args)
    instance = self
    args << {:if => lambda { self == instance }}
    self.class.skip_callback *args
  end

  private
  # asserts that the callback exists in the callback chain
  # @param args [Array] array of options matching the set_callback signiture.  first param is either the method name or the callback type (before/after/around)
  def callback_defined?(name, *args)
    callback_method_name = args[0].in?([:before, :after, :around]) ? args[1] : args[0]
    self.send("_#{name}_callbacks").collect(&:filter).include?(callback_method_name)
  end
end

ActiveRecord::Base.send :include, CallbackSkipper
