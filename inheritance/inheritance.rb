class Employee
  attr_reader :name, :title, :salary
  attr_accessor :boss
  def initialize(name, title, salary, boss = nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss = nil, employees)
    @employees = employees
    assign_boss(employees)
    super(name, title, salary, boss)
  end

  def assign_boss(employees)
    # Assign each employee's boss to equal self --
    employees.each {|employee| employee.boss = self}
  end

  def bonus(multiplier)
    sum = 0
    employees.each do |employee|
      if employee.is_a?(Manager)
        employee.employees.each do |employee2|
          sum += employee2.salary
        end
      end
      sum += employee.salary
    end
    sum * multiplier
  end
end

shawna = Employee.new("Shawna", "TA", 12000)
david = Employee.new("David", "TA", 10000)
darren = Manager.new("Darren", "TA Manager", 78000, nil, [shawna, david])
ned = Manager.new("Ned", "Founder", 1000000, nil, [darren])


p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
