__precompile__()

module Transducers

export transduce

Base.filter(f) = (rf)->(acc, x)->f(x) ? rf(acc, x) : acc
Base.map(f) = (rf)->(acc, x)->rf(acc, f(x))
transduce(transform_fn, reduce_fn, init, xs) = foldl(transform_fn(reduce_fn), init, xs)

end
