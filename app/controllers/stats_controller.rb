class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.length

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum-@minimum

    # Median
    # ======
    if @count % 2 == 0
      @median = (@sorted_numbers[@count/2] + @sorted_numbers[@count/2-1])/2
    else
      @median = @sorted_numbers[@count/2]
    end

    @sum = @numbers.sum

    @mean = @numbers.sum/@count

    # Variance
    # ========
    
    @variance = 0.0
    @numbers.each do |num|
      @variance += (@mean-num)**2
    end
    @variance /= @count

    @standard_deviation = @variance**(0.5)

    # Mode
    # ====
  counter_hashmap = {}
  
  @numbers.each do |num|
    if counter_hashmap[num] == nil
      counter_hashmap[num] = 1
    else
      counter_hashmap[num] += 1
    end
  end
  
  @mode, count = nil, nil
  counter_hashmap.keys.each do |key|
    if @mode == nil
      @mode, count = key, counter_hashmap[key]
    elsif count < counter_hashmap[key]
      @mode, count = key, counter_hashmap[key]
    end
  end

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
