# Collection of methods for averaging pedestrian censor data so it can be used to inform travel decisions

require 'csv'

# Reads in the CSV as an array of arrays. Each inner array has the following properties at the listed indices: [0 - id, 1 - date_time, 2 - year, 3 - month, 4 - mdate, 5 - day, 6 - time, 7 - sensor_id, 8 - sensor_name, 9 - hourly_count]
arr_of_arrs = CSV.read("pedestrian_volume.csv")

# Calculate pedestrian average for a particular sensor

def average_for_id(arr_of_arrays, id)
  total_peds = 0
  number_of_data_points = 0
  arr_of_arrs.each do |array|
    # Can add more conditions here to narrow the average, e.g. add a particular day and/or time of day to find the average for a particular sensor for a particular time of day, e.g. array[5]==day && array[6]==time_period
    if  array[7]==id
      total_peds += array[9].to_i
      number_of_data_points += 1
    end
  end
  average = total_peds/number_of_data_points
end

# Potential parameters to add as additional selectors in average_for_id
day = "Tuesday"
time_period = "9"

# An array of sensor ids to search through. Available ids are 1 to 54.
id_array = ["41","42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54"]

# Iterates through the id_array, outputting the average pedestrian traffic across the specified data.
id_array.each do |id|
  average = average_for_id(arr_of_arrays, id)
  puts "Average pedestrian traffic for #{id} is #{average}"
end