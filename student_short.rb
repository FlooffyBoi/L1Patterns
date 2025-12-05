require_relative "student.rb"
class StudentShort
  attr_reader :id, :surname_initials, :contact_and_type, :git
  def initialize(id:,surname_initials:,contact_and_type:"",git:"")
    @id = id
    @surname_initials=surname_initials
    @contact_and_type=contact_and_type
    @git=git
  end
  public
  def self.from_student(student)
    id = student.id
    surname_initials = student.last_name_initials
    contact_and_type=""
    if(student.has_email?)
      contact_and_type=student.getContact("email")
    end
    if(student.has_tg?)
      contact_and_type=student.getContact("tg")
    end
    if(student.has_phone?)
      contact_and_type=student.getContact("phone")
    end
    git = student.git
    new_student_short = StudentShort.new(id,surname_initials,contact_and_type,git)
    return new_student_short
  end
  def to_s
    str = "{id: #{@id}, surname_initials: #{@surname_initials}, contact_and_type: #{@contact_and_type}, git: #{@git}}"
    return str
  end
  def short_info
    return "#{@id}, #{@surname_initials}, #{@contact_and_type}, #{@git}"
  end
  def has_git?
    return @git!=""
  end
  def has_any_contact?
    return @contact_and_type!=""
  end
end
