require_relative('../db/sql_runner')

class Witch

  attr_reader(:first_name, :last_name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  




  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
