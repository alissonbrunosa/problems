# Conjectura de Collatz
# ----------------------

# fonte: http://en.wikipedia.org/wiki/Collatz_conjecture

# A seguinte sequência iterativa é definida pelo conjunto de inteiros positivos onde:

# n -> n/2 (se n é par) n -> 3n + 1 (se n é impar)

# Usando as regras acima e começando pelo número 13, nós geraríamos a seguinte sequência:

# 13 40 20 10 5 16 8 4 2 1

# O que pode ser observado dessa sequência (começando no 13 e terminando no 1) é que ela contém 10 items. 
# Embora ainda não esteja matematicamente provado, é esperando que, dado um numero inteiro positivo qualquer, 
# a sequencia sempre chegará em 1.

# Pergunta: Qual inteiro positivo abaixo de 1 milhão, produz a sequencia com mais items? 

# Desafio: Crie um código em uma das linguaguens disponíveis que calcule a resposta.


class Collatz
  include Comparable
  attr_reader :number, :elements, :steps
  def initialize(number)
    raise ArgumentError.new("Number is zero or negative.") if number < 1
    @number = number
    @steps = 0
    @elements = algorithm(@number)
  end

  def size
    elements.size
  end

  def <=> (other)
    self.size <=> other.size
  end

  def to_s
    "Number is #{number} with total elements #{size}"
  end

  private 
    def algorithm(num)
      arr = [num]
      loop do
        num = num % 2 == 0 ? num / 2 : (3 * num) + 1
        arr << num
        break if num == 1
      end
      arr
    end
end


#It says that number has more elements between 1_000_000 and 1

def count_collatz(number = 1_000_000)
  max = 0
  number.downto(1) do |number|
    result = Collatz.new(number)
    max = result if result > max
  end
  max
end

puts count_collatz(16)

#TESTE

if ENV['test']
  require 'minitest/autorun'
  alias context describe

  describe Collatz do
    before do
      @collatz = Collatz.new(16)
    end

    describe "when number is invalid" do
      it "must raise a exception" do 
        assert_raises ArgumentError do 
          Collatz.new(0) 
       end
      end
    end

    describe "when number is valid " do
      context "for number 16" do
        it "must have an equal number" do
          @collatz.number.must_equal 16
        end

        it "must have 5 elements " do 
          @collatz.size.must_equal 5
        end

        it "must have the same elements " do 
          @collatz.elements.must_equal [16, 8, 4, 2, 1]
        end
      end
    end
  end
end
