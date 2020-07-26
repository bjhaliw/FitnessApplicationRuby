# This is the most basic class for the Workout Tracker. A set is
# comprised of two pieces of information: the number of reps compelted
# and the amount of weighted lifted.
class Exercise_Set
  def initialize(reps, weight)
    @reps = reps
    @weight = weight
  end
  
  attr_accessor :reps, :weight 
  
  def to_string()
    "Reps: #{@reps} Weight: #{@weight}"
  end
end

# Creates an exercise that stores the name and type,
# along with the list of the sets completed and the total max
# weight lifted, total volume lifted, and the max number of reps
# completed
class Exercise
  def initialize(name, type)
    @exercise_name = name
    @exercise_type = type
    @set_list = []
    @one_rep_max = 0.0
    @max_weight = 0.0
    @total_volume = 0.0
    @max_reps = 0
  end
  
  attr_accessor :exercise_name, :exercise_type, :set_list,
  :max_weight, :total_volume, :max_reps
  
  def print_set_list()
    return_string = ""
    counter = 1
    for i in @set_list 
      return_string += "#{counter} " + i.to_string() + "\n" 
      counter += 1
    end
    
    return_string
  end
  
  def set_max_values()
    max = 0.0
    curr = 0.0
    
    # Setting the max weight lifted
    for set in @set_list 
      if set.weight > max then max = set.weight end
    end   
    @max_weight = max_weight
    
    # Setting one rep max
    max = 0.0
    curr = 0.0    
    for set in @set_list 
      curr = set.weight * (1 + (set.reps / 30))
      if curr_ > max then
        max = curr
      end
    end  
    @one_rep_max = max
    
    # Setting max reps performed
    max = 0.0 
    for set in @set_list
      if set.reps > max then max = set.reps end
    end
    
    @max_reps = max
    
    # Setting max volume lifted
    max = 0.0
    cur = 0.0
    for set in @set_list
      curr = set.weight * set.reps
      if curr > max then max = curr end
    end
    
    @total_volume = max

  end

  def to_string()
    "Exercise name: #{@exercise_name} Exercise type: #{@exercise_type}"
  end

end

# Creates a workout object that stores a list of exercises, the start of
# the workout, and the end of the workout
class Workout
  def initialize()
    @exercise_list = []
    @start_time = Time.now()
    @end_time = 0
    @start_time_string = ""
  end
  
  attr_accessor :exercise_list, :start_time, :end_time, :start_time_string
  
  def print_exercise_list()
    return_string = ""
    counter = 1
    
    for i in @exercise_list
      return_string += "#{counter}: " + i + "\n"
      counter += 1
    end
    
    return_string
      
  end
end

# The workout tracker creates, maintains, and stores information
# about the workouts performed over a period of time as a list
class WorkoutTracker
  def initialize (file)
    @workout_list = []
    load_workouts(file)
  end
  
  def load_workouts(file)
    workout_num = 0
    exercise_num = 0
    
    File.foreach(file) { |line| 
      if line =~ /^Start Time: (\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}).[0-9]* +|-\d*$/  then
        workout_num += 1
        exercise_num = -1
        @workout_list << Workout.new.start_time=($1)
      elsif line =~ /^\s*Exercise name: (\w*\D+\s*\w*) Exercise Type: (\w+)$/ then
        exercise_num += 1
        exercise = Exercise.new()
        exercise.exercise_name = $1
        exercise.exercise_type = $2
        @workout_list[workout_num] << exercise
    end
    }
  end
end
