class ReadAndWrite
  
  def save_exercises(file)
    
  
  end
  
  def load_exercises(file)
    
  
  end
  
  # Saves the workout tracker to the desginated plain text file
  def save_workouts(workoutlist, file)    
    File.open(file, 'w') { |file| 
      for workout in workoutlist do
        file.write("Start Time: #{workout.start_time}\n")
        for exercise in workout.exercises do
          file.write("    #{exercise.to_string()}\n")
          for set in exercise.sets do
            file.write("        #{set.to_string()}\n")
          end
        end
        
        file.write("\n")
      end
    }
  end
    
  # Parses and creates workouts from a plain text document
  def load_workouts(file)
      workout_num = 0
      exercise_num = 0
      workout_list = []
      
      File.foreach(file) { |line| 
        if line =~ /^Start Time: (\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}).[0-9]* +|-\d*$/  then
          workout_num += 1
          exercise_num = -1
          workout_list << Workout.new.start_time=($1)
        elsif line =~ /^\s*Exercise name: (\w*\D+\s*\w*) Exercise Type: (\w+)$/ then
          exercise_num += 1
          exercise = Exercise.new()
          exercise.exercise_name = $1
          exercise.exercise_type = $2
          workout_list[workout_num] << exercise
      end
      }
      
      workout_list #return created workoutlist 
    end
end