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
        @call_chain.reduce(object) do |current, (name, args, block)|
          case args.first
          when Context
            current[0].public_send(name, current[1], &block)
          else
            current.public_send(name, *args, &block)
          end
        end
      end
    end
  end

  Kernel.send(:define_method, :_) { Context.__new_uberscore_context__ }
end
