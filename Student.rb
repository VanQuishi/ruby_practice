class Student
    public
        def initialize(name,grade)
            @name = name
            @grade = grade
        end

        def better_grade_than?(other_student)
            self.grade > other_student.grade
        end

    protected
        def grade
            @grade
        end
end

nin = Student.new("Nin", 95)
neko = Student.new("Neko", 90)
puts "WOW" if nin.better_grade_than?(neko)