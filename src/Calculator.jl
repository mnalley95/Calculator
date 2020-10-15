# Calculator.jl
module Calculator

export interest, rate

"""
 interest(amount, rate)

Calculate interest from an `amount` and interest rate of `rate`.
"""
function interest(amount, rate)
 return amount * (1 + rate)
end

"""
 rate(amount, interest)

Calculate interest rate based on an `amount` and `interest`.
"""
function rate(amount, interest)
 return interest / amount
end

end # module


#using a type parameter enables flexible typing - ex: be able to hold int and fractional shares
struct StockHolding{T <: Real}
    stock::Stock
    quantity::T
end