class Question
  def initialize
    @num_1 = rand(1..20)
    @num_2 = rand(1..20)
    @solution = @num_1 + @num_2
  end

  def ask_question
    "What does #{@num_1} plus #{@num_2} equal?"
  end

  def evaluate_answer(answer)
    answer.to_i == @solution
  end
end