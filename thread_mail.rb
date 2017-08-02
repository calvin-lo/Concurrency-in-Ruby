# Modify from
# https://github.com/eqbal/threads_and_forks
# https://dzone.com/articles/ruby-concurrency-and

require "./lib/mailer"
require "benchmark"

threads = []

100.times do |i|
  threads << Thread.new do
    Mailer.deliver do
      from    "eki_#{i}@eqbalq.com"
      to      "jill_#{i}@example.com"
      subject "Threading and Forking (#{i})"
      body    "Some content"
    end
  end
end
threads.map(&:join)
