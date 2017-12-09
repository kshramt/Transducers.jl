import Base.Test: @test, @test_throws

using Transducers


let
    @test transduce(filter((x)->x%2 == 0)∘map((x)->x + 3), +, 0, 1:10) == (2 + 3) + (4 + 3) + (6 + 3) + (8 + 3) + (10 + 3)
    @test transduce(filter((x)->x%2 == 0)∘map((x)->x + 3), -, 0, 1:10) == 0 - (2 + 3) - (4 + 3) - (6 + 3) - (8 + 3) - (10 + 3)
    @test reduce((filter((x)->x%2 == 0)∘map((x)->x + 3))(+), 0, 1:10) == (2 + 3) + (4 + 3) + (6 + 3) + (8 + 3) + (10 + 3)
    @test foldl((filter((x)->x%2 == 0)∘map((x)->x + 3))(+), 0, 1:10) == (2 + 3) + (4 + 3) + (6 + 3) + (8 + 3) + (10 + 3)
end
