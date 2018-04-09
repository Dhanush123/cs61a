def ab_plus_c(a, b, c):
    """Computes a * b + c.

    >>> ab_plus_c(2, 4, 3)  # 2 * 4 + 3
    11
    >>> ab_plus_c(0, 3, 2)  # 0 * 3 + 2
    2
    >>> ab_plus_c(3, 0, 2)  # 3 * 0 + 2
    2
    """
    if b == 0:
      return c
    else:
      return a + ab_plus_c(a, b - 1, c)

def gcd(a, b):
    """Returns the greatest common divisor of a and b.
    Should be implemented using recursion.

    >>> gcd(34, 19)
    1
    >>> gcd(39, 91)
    13
    >>> gcd(20, 30)
    10
    >>> gcd(40, 40)
    40
    """
    big = max(a,b)
    sml = min(a,b)
    if big % sml == 0:
      return sml
    else:
      return gcd(b, a % b)

def hailstone(n):
    """Print out the hailstone sequence starting at n, and return the
    number of elements in the sequence.

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    """
    def helper(num, steps):
      print(num)
      steps += 1
      if num % 2 == 0 and num > 1:
        return helper(num//2, steps)
      elif num % 2 != 0 and num > 1:    
        return helper(num * 3 + 1, steps)
      else:
        return steps
    return helper(n, 0)
