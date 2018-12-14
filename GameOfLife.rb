n = 10
def out
  n = 10
  (0..n - 1).each do |i|
    (0..n - 1).each do |j|
      if @Field[i][j] == 1
        print 'x'
      else
        print '.'
      end
    end
    puts ''
  end
end

@Field = Array.new(n)
(0..n - 1).each do |i|
  @Field[i] = Array.new(n)
end
(0..n - 1).each do |i|
  (0..n-1).each do |j|
    @Field[i][j] = rand(2)
  end
end
temp = @Field
out
puts ''
(1..n - 2).each do |i|
  (1..n-2).each do |j|
    life = 0
    life = @Field[i][j+1] + @Field[i][j-1] + @Field[i-1][j-1..j+1].sum+@Field[i+1][j-1..j+1].sum
    if life == 3
      temp[i][j] = 1
    end
    if life < 2 && life > 3
      temp[i][j] = 0
    end
  end
end
Field = temp.clone
out