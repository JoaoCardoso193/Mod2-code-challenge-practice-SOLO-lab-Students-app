class Instructor < ApplicationRecord
    has_many :students

    def average_student_age
        ages = self.students.map{|student| student.age}
        ages.inject(0){|sum, age| sum + age}.to_f / ages.length.to_f
    end

    def alphabetical_students
        self.students.sort_by{|student| student.name}
    end
end
