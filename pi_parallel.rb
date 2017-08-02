# CSCI 4060U Final Project
# Calvin Lo
# 100514352
# Running pi approximation in Ruby with Thread

NUM_THREADS = 8
num_steps = 100000000

sum = []
arr = []
step = 1.0/num_steps
thread_count = 0

NUM_THREADS.times do |i|
   arr << Thread.new do
      thread_id = i
      sum[thread_id] = 0.0
      t_count = NUM_THREADS
      if (thread_id == 0)
        thread_count = t_count
      end
      for j in (thread_id..num_steps).step(t_count)
        x = (j+0.5)*step
        sum[thread_id] = sum[thread_id] + 4/(1.0+x*x)
      end
  end
end

arr.each do |t|
  t.join
end

pi = 0.0
thread_count.times do |i|
  pi += step * sum[i].to_f
end

puts pi
