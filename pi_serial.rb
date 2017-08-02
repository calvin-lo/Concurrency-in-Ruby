# CSCI 4060U Final Project
# Calvin Lo
# 100514352
# Running pi approximation in serial

num_steps = 100000000
step = 1.0/num_steps

pi = 0.0
num_steps.times do |j|
  x = (j+0.5)*step.to_f
  pi = pi + 4/(1.0+x*x)
end

puts pi * step
