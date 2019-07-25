class Recipe
  attr_reader :name, :description, :prep_time, :difficulty, :done
  def initialize(name, description, prep_time = 0, difficulty = 'easy', done = false)
    @name = name
    @description = description
    @prep_time = prep_time
    @difficulty = difficulty
    @done = done
  end

  def done?
    @done
  end

  def mark!
    @done = !@done
  end
end
