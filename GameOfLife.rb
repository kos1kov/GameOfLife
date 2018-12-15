@col = 80
@row = 18
def out
  (0..@row - 1).each do |i|
    (0..@col - 1).each do |j|
      if @Field[i][j] == 1
        print 'x'
      else
        print '.'
      end
    end
    puts ''
  end
end

def create
  @Field = Array.new(@row)
  (0..@row - 1).each do |i|
    @Field[i] = Array.new(@col)
  end
  (0..@row - 1).each do |i|
    (0..@col - 1).each do |j|
      @Field[i][j] = rand(2)
    end
  end
end

def evolution
  @change = 0
  temp = @Field
  (1..@row - 2).each do |i|
    (1..@col - 2).each do |j|
      life = 0
      life = @Field[i][j+1] + @Field[i][j-1] + @Field[i-1][j-1..j+1].sum+@Field[i+1][j-1..j+1].sum
      if life == 3 && temp[i][j].zero?
        temp[i][j] = 1 
        @change += 1
      end
      if  (temp[i][j] == 1) && (life < 2 || life > 3) 
        temp[i][j] = 0 
        @change += 1
      end
    end
  end
  @Field = temp.clone
end

def check
  amount = 0
  @Field.each{|i| amount += i.count(1)}
  if amount == 0 || @change == 0
    false
  else
    true
  end
end

def run 
  while check
    sleep 0.5
    evolution
    out
    puts '---------------------------------'
  end
  puts 'end of game'
end
# main 
create
run