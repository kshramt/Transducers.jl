__precompile__()

module Transducers

import Base: map, filter

export comp
export transduce


transduce(transform_fn::Function, reduce_fn::Function, init, xs) = foldl(transform_fn(reduce_fn), init, xs)
transduce(transform_fn::Function, reduce_fn::Function, xs) = transduce(transform_fn, reduce_fn, reduce_fn(), xs)


function filter(f::Function)
    function transform_fn(reduce_fn)
        function transformed_reduce_fn(ret, x)
            if f(x)
                reduce_fn(ret, x)
            else
                ret
            end
        end
    end
end


function map(f::Function)
    function transform_fn(reduce_fn)
        function transformed_reduce_fn(ret, x)
            reduce_fn(ret, f(x))
        end
    end
end


function comp(g::Function, f::Function)
    composed_fn() = g(f())
    composed_fn(x) = g(f(x))
    composed_fn(x, y) = g(f(x, y))
    composed_fn(x, y, z...) = g(f(x, y, z...))
    composed_fn
end
comp() = identity
comp(f::Function) = f
comp(g::Function, f::Function, e::Function...) = foldl(comp, [f, g, e...])

end
