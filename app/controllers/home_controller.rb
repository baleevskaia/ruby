require 'tax_service'

class HomeController < ApplicationController
  def index
    parameters = params[:_json]
    return if parameters.nil?

    data = ActiveSupport::JSON.decode(parameters)
    years = get_years(data)
    taxable_amount = get_taxable_amount(data)
    render json: TaxService.calculate_tax(years, taxable_amount)
  end

  def get_taxable_amount(data)
    buy_price = data['BuyPrice'].to_f
    sell_price = data['SellPrice'].to_f
    sell_price > buy_price ? sell_price - buy_price : 0
  end

  def get_years(data)
    buy_date = Date.parse data['BuyDate']
    sell_date = Date.parse data['SellDate']
    get_difference_in_years(buy_date, sell_date)
  end

  def get_difference_in_years(first, second)
    difference = second.year - first.year
    difference -= 1 if
    (first.month > second.month) ||
    ((first.month == second.month) && (first.day >= second.day))
    difference
  end
end