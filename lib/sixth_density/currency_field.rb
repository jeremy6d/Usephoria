module SixthDensity::CurrencyField
  def self.included(base)
    base.class_eval do
      def self.currency_field name, default_dollars = 0
        default_cents = (default_dollars * 100).to_i
        field "#{name}_in_cents".to_sym, 
              type: Integer, 
              default: default_cents

        define_method "#{name}=" do |dollars|
          write_attribute "#{name}_in_cents".to_sym, Integer(dollars.to_f * 100)
        end

        define_method name do
          read_attribute("#{name}_in_cents".to_sym).to_f / 100.0
        end
      end
    end
  end
end