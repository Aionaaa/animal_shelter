require_relative('../db/sql_runner')

class Familiar

  attr_reader(:name, :species, :admission_date, :adoptable, :id)

  def initialize(options)
    @id = options['id'].to_i if
      options['id']
      @name = options['name']
      @species = options['species']
      @admission_date = options['admission_date']
      @adoptable = options['adoptable']
      @owner_id = options['owner_id'].to_i
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
      values = [@name, @type]
      results = Sqlrunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

  






  end
