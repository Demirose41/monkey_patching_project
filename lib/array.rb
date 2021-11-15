# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
    def is_empty
        return nil if self.length == 0
    end

    def span
        return nil if self.length == 0
        max = self[0] 
        min = self[0]
        self.each do |ele|
            if ele > max 
                max = ele
            elsif ele < min 
                min = ele
            end
        end

        return max - min
    end

    def average
        return nil if self.length == 0
        sum = self.inject { |result, i| result + i}
        (sum * 1.0) / self.length
    end

    def median
        return nil if self.length == 0 
        if self.length % 2 != 0
            idx = self.length / 2
            self.sort[idx] 
        else
            
            idx_1 = self.length / 2 
            idx_2 = idx_1 - 1 
            (self.sort[idx_1] + self.sort[idx_2]) / 2.0
        end
    end

    def counts
        count = Hash.new(0)
        self.each { |ele| count[ele] += 1 }
        count
    end

    def my_count(key)
        count = 0
        self.each do |ele| 
            if ele == key  
                count += 1 
            end
        end
        return count
    end

    def my_index(key)
        self.each_with_index do |ele, idx|
            if ele == key 
                return idx
            end
        end
        nil 
    end

    def my_uniq
        new_array = []
        self.each do |ele|
            if new_array.none?(ele)
                new_array << ele
            end
        end
        new_array
    end

    def my_transpose
        new_array = []

        (0...self.length).each do |row|
            new_row = []

            (0...self.length).each do |col|
                new_row << self[col][row]
            end

            new_array << new_row
        end

        new_array
    end
end
