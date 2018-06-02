class Eratosthenes
  def self.call(max, numbers = nil)
    numbers ||= (2..max).to_a

    prime = numbers.first

    return numbers if prime.nil? || prime * prime > max

    [prime].concat call(max, numbers.select { |n| n % prime != 0 })
  end
end

p Eratosthenes.call(120)
