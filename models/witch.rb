require_relative('../db/sql_runner')

class Witch

  attr_reader(:first_name, :last_name)






  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
