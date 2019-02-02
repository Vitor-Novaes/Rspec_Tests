class CalculatorSimple
    
    def initialize()
    end

    def sum(a,b)
      return RaiseErrors(a,b) unless RaiseErrors(a,b).nil?
      a + b
    end

    def sub(a,b)
      return RaiseErrors(a,b) unless RaiseErrors(a,b).nil?
      a - b
    end

    def mul(a,b)
      return RaiseErrors(a,b) unless RaiseErrors(a,b).nil?
      a * b
    end

    def div(a,b)
      return RaiseErrors(a,b) unless RaiseErrors(a,b).nil?
      RaiseDiv(a,b)
      a / b
    end
    
    private

    def RaiseErrors(a,b)
      if a.class == String or b.class == String
        return "Operação Inválida. Only Numbers"
      elsif a.nil? or b.nil?
        return "Operação Inválida. Argumentos Nulo"
      end
      nil
    end
    
    def RaiseDiv(a,b)
      return "Divisão por Zero" if b == 0
      nil
    end
    
    
    
end