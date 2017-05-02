class Eratosthenes
  attr_reader :root, :max, :primes
  ZERO = 0
  FIRST_PRIME = 2

  def initialize(max)
    @max = max
    @root = Math.sqrt(@max).floor
    count_primes
  end

  def count
    primes.count
  end

  def to_s
    %|
      Number of primes: #{count}
      Primes: #{primes.join(" ")}
    |
  end

  private

  def count_primes
    numbers = (FIRST_PRIME..max).to_a
    FIRST_PRIME.upto(root) do |number|
      next unless numbers.include?(number)
      numbers.reject! do |n|
        next if n == number
        n % number == ZERO
      end
    end
    @primes ||= numbers
  end
end


e = Eratosthenes.new(100)
puts e
