# Subcadeia da soma máxima
# ----------------------------

# Dado um conjunto de números, descobrir o subconjunto em que a soma dos elementos são de máxima soma.

# Exemplo: dado o conjunto de elementos [2, -4, 6, 8, -10, 100, -6, 5]

# O subconjunto de soma máxima é: [2, -4, **6, 8, -10, 100**, -6, 5]

# Assim, o programa deve retornar a posição do primeiro e do último elemento da subcadeia. 
# Neste exemplo, as posições 2 e 5, considerando a primeira posição com índice 0.

class MaxSubArray
  attr_reader :sequence, :first, :last, :sum
  def initialize(sequence)
    @sequence = sequence
    @first, @last, @sum = algorithm
  end

  def sub_sequence
    sequence[first..last]
  end

  private 
    def algorithm
      first = last = result = sum = start = 0
      return if sequence.size <= 0
      sequence.each_with_index do |element, index|
        result += element
        if element > result
          result = element
          start = index
        end
        if result > sum
          sum = result
          first = start
          last = index
        end
      end         
      return first, last, sum
    end
end

