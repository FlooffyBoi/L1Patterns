def max_prime_factor(num)
  i=2
  n = num
  while i*i <= n
    if n % i == 0
      n /= i 
    else
      i+=1
    end
  end
  return n
end

def non_five_product(num)
  n = num
  prod = 1
  while n > 0
    if(n%10!=5)
      prod *= n % 10
      n /= 10
    end
  end
  return prod
end

def is_prime(num)
  n = Math.sqrt(num).floor
  for fac in 2..n
    if num%fac==0
      return false
    end
  end
  return true
end

def max_composite_factor(num)
  n = num
  factor = 2
  max_factor = factor
  while factor<n-1
    if (!is_prime(factor))
      if(n%factor==0) 
        max_factor=factor
      end
    end
    factor+=1
  end
  return max_factor
end

def num_product(num)
  n = num
  prod = 1
  while n > 0
    prod *= n % 10
    n /= 10
  end
  return prod
end

def gdc_odd_composite_product(num)
  # наибольший общий делитель 
  # максимального составного делителя
  # и произведения цифр num
  first = max_composite_factor(num)
  second = num_product(num)
  factor = 1
  fac_it = 2
  while fac_it < [first,second].min
    if(first%fac_it==0 and second%fac_it==0)
      first/=fac_it
      second/=fac_it
      factor*=fac_it
    else
      fac_it+=1
    end
  end
  return factor
end
  
puts gdc_odd_composite_product(48)



  