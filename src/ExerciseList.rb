class ExerciseList
  def initialize(file)
    @exercises = {} # Key: Name Value: Exercise
  end
  
  def add_exercise(exercise)
    if @exercises.hasKey?(exercise.name) 
      puts "#{exercise.name} already exists in the database.\n" 
    else
      @exercises[exercise.name] = exercise
    end
  end

  
  def remove_exercise(exercise)
    if @exercises.hasKey?(exercise.name)
      @exercises
    end
  end
end