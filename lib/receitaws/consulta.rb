module Receitaws
  class Consulta
    def initialize(params)
      @data = params

      @data.each do |k,v|
        self.class.send(:attr_accessor, k.to_sym)
        instance_variable_set("@#{k}", v)
      end
    end

    def to_h
      @data
    end
  end
end