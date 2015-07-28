require "uberscore/version"

module Uberscore
  class Context < BasicObject
    class << self
      alias_method :__new_uberscore_context__, :new
      undef_method :new
    end

    undef_method :!
    undef_method :!=
    undef_method :==
    undef_method :__id__

    def initialize
      @call_chain = []
    end

    def method_missing(name, *args, &block)
      @call_chain << [name, args, block]
      self
    end

    def to_proc
      ->(object) do
        @call_chain.reduce(object) do |block_params, (method_name, method_arguments, block)|
          underscore_index = 0
          mapped = method_arguments.map do |argument|
            if Context === argument
              underscore_index += 1

              sub_subject = block_params[underscore_index + 1] ? block_params.drop(underscore_index) : block_params[underscore_index]
              argument.to_proc.(sub_subject)
            else
              argument
            end
          end

          subject = underscore_index == 0 ? block_params : block_params.first

          subject.public_send(method_name, *mapped, &block)
        end
      end
    end
  end

  Kernel.send(:define_method, :_) { Context.__new_uberscore_context__ }
end
