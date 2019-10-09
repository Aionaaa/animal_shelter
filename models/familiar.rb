require_relative('../db/sql_runner')

class Familiar

  attr_accessor(:name, :species, :admission_date, :adoptable, :owner_id)
  attr_reader(:id)


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @species = options['species']
    @admission_date = options['admission_date']
    @adoptable = options['adoptable']
    @owner_id = options['owner_id'].to_i if options['owner_id']
  end

  def save()
    sql = "INSERT INTO familiars
    (
      name,
      species,
      admission_date,
      adoptable,
      owner_id
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
    values = [@name, @species, @admission_date, @adoptable, @owner_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM familiars"
    results = SqlRunner.run(sql)
    return results.map{|hash| Familiar.new(hash)}
  end

  def self.find(id)
    sql = "SELECT * FROM familiars WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    return Familiar.new(results.first)
  end

  def self.delete_all()
    sql = "DELETE FROM familiars"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM familiars WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE familiars
    SET
    (
      name,
      species,
      admission_date,
      adoptable,
      owner_id
      ) =
      (
        $1, $2, $3, $4, $5
      )
      WHERE id = $6"
      values = [@name, @species, @admission_date, @adoptable, @owner_id, @id]
      SqlRunner.run(sql, values)
    end

    def witch
      witch = Witch.find(@owner_id)
      return witch
    end

end
