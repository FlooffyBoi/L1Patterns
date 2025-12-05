class Student
  attr_accessor :surname,:name,:middle_name,:git
  attr_reader :id
  @@next_id = 0
  def initialize( surname:, name:, middle_name:"", phone:"", tg: "",email:"",git:"", id:nil)
    if(id==nil)
      @id = @@next_id
      @@next_id+=1  
    end
    @surname = surname
    @name = name
    @middle_name = middle_name
    @phone = phone
    @tg = tg
    @email = email
    @git = git
  end
  
  # Setters
  public
  def surname=(v)
    if(valid_surname?(v))
      @surname=v
    end
  end
  def name=(v)
    if(valid_name?(v))
      @name = v
    end
  end
  def middle_name=(v)
    if(valid_middle_name?(v))
      @middle_name = v
    end
  end
  def git=(v)
    if(valid_git?(v))
      @git = v
    end
  end
  private 
  def phone=(v)
    if(valid_phone?(v))
      @phone = v
    end
  end
  def tg=(v)
    if(valid_tg?(v))
      @tg = v
    end
  end
  def email=(v)
    if(valid_email?(v))
      @email = v
    end
  end
  def id=(v)
    if(@id==nil and valid_id?(v))
      @id=v
    end
  end

  # Getters (explicit)
  private
  def phone 
    @phone
  end
  def tg
    @tg
  end
  def email
    @email
  end

  # Validators
  public
  def valid_email?
    regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
    return regex.match?(@email)
  end
  def valid_proper_name?(text)
    regex= /^[A-Z][a-z]*/
    return regex.match?(text)
  end
  def valid_name?(name)
    return valid_proper_name?(name)
  end
  def valid_surname?(surname)
    return valid_proper_name?(surname)
  end
  def valid_middle_name?(middle_name)
    return valid_proper_name?(middle_name)
  end
  def valid_id(id)
    return (id==id.floor and id>=0)
  end
  def valid_phone?(phone)
    regex = /^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/
    return regex.match?(phone)
  end
  def valid_tg?(tg)
    regex = /^[@][A-Za-z0-9_]+/
    return regex.match?(tg)
  end
  def valid_git?(git)
    regex = /^https:\/\/github.com\/[A-Za-z0-9_]+/
    return regex.match?(git)
  end
  
  # General Functions
  public 
  def getContact(type) 
    contacts = {
      "phone" => "phone - #{@phone}",
      "tg" => "tg - #{@tg}",
      "email" => "email - #{@email}",
    }
    return contacts[type]
  end
  def last_name_initials
    return @surname+' '+@name[0]+'. '+@middle_name[0]+'.'
  end
  def to_s
    str = "{id: #{@id}"
    fields = {
      "surname" => @surname,
      "name" => @name,
      "middle_name" => @middle_name,
      "phone" => @phone,
      "tg" => @tg,
      "email" => @email,
      "git" => @git
    }
    for field in fields
      str+=", #{field[0]}: #{field[1]}"
    end
    str+="}"
    return str
  end
  def short_info
    str = "#{@id}, #{last_name_initials}, "
    if(@phone!="")
      str+="#{@phone}, "
    else
      if(@email!="")
        str+="#{@email}, "
      else
        if(@tg!="")
          "#{@tg}, "
        end
      end
    end
    str+="#{@git}"
  end
  def has_git?
    return @git!=""
  end
  def has_phone?
    return @phone!=""
  end
  def has_tg?
    return @tg!=""
  end
  def has_email?
    return @email!=""
  end
  def has_any_contact?
    return (self.has_email? || self.has_phone? || self.has_tg?)
  end
end
