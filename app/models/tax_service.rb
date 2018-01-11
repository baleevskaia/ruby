require 'json'

class TaxService

  NON_TAXABLE_PERIOD = 5
  TAX_RATE = 0.13

  def self.calculate_tax(years, sum)
    tax_base = sum.round(2)
    tax_deduction = (years >= NON_TAXABLE_PERIOD ? sum : 0).round(2)
    tax_amount = ((tax_base - tax_deduction) * TAX_RATE).round(2)

    foo = {
      FullYearsOwned: years,
      TaxBase: tax_base,
      TaxDeduction: tax_deduction,
      TaxAmount: tax_amount
    }
    foo
  end
end
