require "defp/version"

module Defp
  def self.extended(base)
    base.send :include, DefpMethods
    base.extend DefpMethods
  end

  module DefpMethods
    def defp(*args)
      matches_pattern?(*args) ? Defp::Between.new : Defp::NullBetween.new
    end

    def matches_pattern?(*args)
      # arg[1] == called_by_method_args
      # arg[0] == pattern_args
      args.zip(@__last_args)
      .select { |arg| arg[0] }
      .all? do |arg|
        # TODO cleanup
        if arg[0].is_a? Hash
          pattern_args = arg[0].reject {|_,v| !v}
          pattern_args.keys.all? { |key| arg[1][key] == arg[0][key] }
        else
          arg[0] == arg[1]
        end
      end
    end

    def _
      false
    end
  end

  class NullBetween
    def ==(_)
      nil
    end
  end

  class Between
    def ==(param)
      value = param.is_a?(Proc) ? param.call : param
      throw :CallBaeckerDone, value
    end
  end
end
