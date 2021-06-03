class Dock
  attr_reader :name, :max_rental_time
  attr_accessor :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log =  {}
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
  end

  def charge(boat)
    charges = {}
    renter = @rental_log[boat]
    if boat.hours_rented > @max_rental_time
      charged_amount = boat.price_per_hour * @max_rental_time
    else boat.hours_rented == @max_rental_time
      charged_amount = boat.price_per_hour * boat.hours_rented
    end
    charges[:card_number] = renter.credit_card_number
    charges[:amount] = charged_amount
    charges
  end
  #   max_cost = (boat.price * @max_rental_time)
  #   cost = (boat.hours_rented * boat.price_per_hour)
  #   if cost < max_cost
  #     cost
  #   else
  #     max_cost
  #   end
  #   total_fees
  # end
end
