import Base.Test: @test, @test_throws

unshift!(LOAD_PATH, joinpath(dirname(@__FILE__), "..", "src"))
using Transducers


let
    @test transduce(comp(filter((x)->x%2 == 0), map((x)->x + 3)), +, 0, 1:10) == (2 + 3) + (4 + 3) + (6 + 3) + (8 + 3) + (10 + 3)
end
