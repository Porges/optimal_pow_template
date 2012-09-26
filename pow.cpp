#include <iostream>
#include <typeinfo>
#include <math.h>


template<class T>
class op_tracker
{
    T _value;
    size_t _ops;

    op_tracker(T value, size_t ops) : _value(value), _ops(ops) {}
public:
    constexpr
    op_tracker(T value) : op_tracker(value, 0) {}

    constexpr friend
    op_tracker<T> operator*(const op_tracker& left, const op_tracker& right)
    {
        return op_tracker<T>(left._value * right._value, left._ops + right._ops +1);
    }

    constexpr size_t ops() { return _ops; }
};

template<class T>
constexpr T square(T value)
{
    return value * value;
}

template<size_t exp>
struct repeated_squares_pow
{
    template<class T>
    static constexpr
    T op(T base)
    {
        return square(repeated_squares_pow<exp/2>::op(base)) * repeated_squares_pow<exp%2>::op(base);
    }

    static constexpr size_t opcount = repeated_squares_pow<exp/2>::opcount + 1 + (exp % 2);
};

template<>
struct repeated_squares_pow<0>
{
    template<class T>
    static constexpr
    T op(T base)
    {
        return 1;
    }

    static constexpr size_t opcount = 0;
};

template<>
struct repeated_squares_pow<1>
{
    template<class T>
    static constexpr
    T op(T base)
    {
        return base;
    }

    static constexpr size_t opcount = 0;
};


template<size_t exp,size_t part=exp-1> struct find_best;

template<size_t exp>
struct optimal_pow
{
    template<class T>
    static constexpr
    T op(T base)
    {
        return find_best<exp>::type::op(base);
    }

    template<size_t x>
    struct computes
    {
        static constexpr bool value = exp == x || find_best<exp>::type::template computes<x>::value;
    };

    static constexpr size_t opcount = find_best<exp>::type::opcount;
};

template<>
struct optimal_pow<1>
{
    template<class T>
    static constexpr
    T op(T base)
    {
        return base;
    }

    template<size_t x>
    struct computes
    {
        static constexpr bool value = false;
    };

    static constexpr size_t opcount = 0;
};

template<>
struct optimal_pow<0>
{
    template<class T>
    static constexpr
    T op(T base)
    {
        return 1;
    }

    static constexpr size_t opcount = 0;
};

template<size_t i, size_t j>
struct from
{
    template<class T>
    static constexpr
    T op(T base)
    {
        return optimal_pow<i>::op(base) * optimal_pow<j>::op(base);
    }

    template<size_t x>
    struct computes
    {
        static constexpr bool value = optimal_pow<i>::template computes<x>::value || optimal_pow<j>::template computes<x>::value;
    };

    static constexpr size_t opcount = (optimal_pow<j>::template computes<i>::value ? 0 : optimal_pow<i>::opcount) + optimal_pow<j>::opcount + 1;
};

template<size_t i>
struct from<i,i>
{
    template<class T>
    static constexpr
    T op(T base)
    {
        return square(optimal_pow<i>::op(base));
    }

    template<size_t x>
    struct computes
    {
        static constexpr bool value = optimal_pow<i>::template computes<x>::value;
    };

    static constexpr size_t opcount = optimal_pow<i>::opcount + 1;
};

template<size_t exp, size_t part>
struct find_best
{
    typedef typename std::conditional<
        from<part, exp-part>::opcount <= find_best<exp, part-1>::type::opcount,
        from<part, exp-part>,
        typename find_best<exp, part-1>::type>::type type;
};

template<size_t exp>
struct find_best<exp, 1>
{
    typedef from<1, exp-1> type;
};

int main()
{
    double value;
    std::cin >> value;
    std::cout << optimal_pow<91>::opcount << " " << optimal_pow<91>::op(value) << std::endl;
    std::cout << repeated_squares_pow<91>::opcount << " " << repeated_squares_pow<91>::op(value) << std::endl;
    std::cout << pow(value, 91) << std::endl;

    //op_tracker<double> value2(value);
    //std::cout << optimal_pow<91>::op(value2).ops() << std::endl;

    return 0;
}
