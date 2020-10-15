"""
creating asset tree hierarchy

"""

abstract type Asset end

abstract type Property <: Asset end
abstract type Investment <: Asset end
abstract type Cash <: Asset end

abstract type House <: Property end
abstract type Apartment <: Property end

abstract type FixedIncome <: Investment end
abstract type Equity <: Investment end


#composite type
#by default, is immutable
#can be made mutable by adding mutable in front of struct
mutable struct Stock <: Equity
    symbol::String
    name::String
end

function describe(s::Stock)
    return s.symbol * "(" * s.name * ")"
end


struct BasketOfStocks
    stocks::Vector{Stock}
    reason::String
end




abstract type Art end

struct Painting <: Art
    artist::String
    title::String
end


#demonstrating how Union works: enables multiple data types to be allowed in a field
const Thing = Union{Painting,Stock}

struct BasketOfThings
    thing::Vector{Thing}
    reason::String
end


# Display the entire type hierarchy starting from the specified `roottype`
function subtypetree(roottype, level = 1, indent = 4)
    level == 1 && println(roottype)
    for s in subtypes(roottype)
       println(join(fill(" ", level * indent)) * string(s))
       subtypetree(s, level + 1, indent)
    end
end


#using a type parameter enables flexible typing - ex: be able to hold int and fractional shares
struct StockHolding{T <: Real}
    stock::Stock
    quantity::T
end

#using two type parameters: this enforces price and marketvalue to both be of the same data type
struct StockHolding2{T <: Real, P <: AbstractFloat} 
    stock::Stock
    quantity::T
    price::P
    marketvalue::P
end

#parametric abstract types
abstract type Holding{P} end


struct StockHolding3{T, P} <: Holding{P}

    stock::Stock
    quantity::T
    price::P
    marketvalue::P
   end
   
   struct CashHolding{P} <: Holding{P}
    currency::String
    amount::P
    marketvalue::P
   end