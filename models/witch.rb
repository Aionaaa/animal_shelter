require_relative('../db/sql_runner')

class Witch

  attr_reader(:first_name, :last_name)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO witches
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM witches"
    results = SqlRunner.run(sql)
    return results.map{|hash| Witch.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM witches WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Witch.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM witches"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM witches WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def format_name
    return "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
