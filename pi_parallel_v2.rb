num_steps = 1000
step = 1.0/num_steps;
pi = 0.0
sum = []

num_steps.times do |j|
  fork do
    x = (j+0.5)*step
    pi = pi + 4/(1.0+x*x)
    sum[j] = pi
  end
end
Process.waitall

print sum[1]