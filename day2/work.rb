require "active_support/all"

pairs = open("day2/data.txt").read.split.map(&:strip).map do |s|
  sorted = s.split("").sort.join.gsub(/(.)\1\1\1+/, "")

  threes = sorted.scan(/(.)\1\1/).flatten.any?

  sorted.gsub!(/(.)\1\1/, "")

  twos = sorted.scan(/(.)\1/).flatten.any?

  [threes, twos, s]
end; nil

puts pairs.map(&:first).select { |x| x }.count * pairs.map(&:second).select { |x| x }.count


ids = open("day2/data.txt").read.split.map(&:strip); nil

ids.each do |id|
  ids.each do |other_id|
    wrong = []

    other_id.split("").each_with_index do |c, i|
      if c != id[i]
        wrong << c
      end
    end

    if wrong.size == 1
      puts "Only one difference (#{wrong}) between #{id} and #{other_id}"
    end
  end
end; nil
