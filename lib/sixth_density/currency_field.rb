module SixthDensity::CurrencyField
  module ClassMethods
    def float_to_cents float
      float = float.to_f unless float.is_a?(Float)
      Integer(float * 100)
    end

    def cents_to_float cents 
      cents = cents.to_i unless cents.is_a?(Integer)
      Float(cents / 100.0)
    end

    def currency_field name, default_dollars = 0
      default_cents = float_to_cents(default_dollars)
      
      field "#{name}_in_cents".to_sym, 
            type: Integer, 
            default: default_cents

      define_method "#{name}=" do |dollars|
        write_attribute "#{name}_in_cents".to_sym, 
                        self.class.float_to_cents(dollars)
      end

      define_method name do
        self.class.cents_to_float read_attribute("#{name}_in_cents".to_sym)
      end
    end
  end

  def self.included(base)
    base.class_eval do
      base.extend ClassMethods
    end
  end
end