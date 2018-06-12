class Pokemon


  attr_accessor :name, :type, :db, :id, :hp


  def initialize(props = {})
    @name = props['name']
    @type = props['type']
    @db = props['db']
    @id = props['id']
    @hp = props['hp'] || 60
  end

  def self.save(name, type, db)
    sql_string = <<-SQL_STRING

      INSERT INTO pokemon
      (name, type) VALUES (?, ?)

    SQL_STRING

    db.execute(sql_string, name, type)
  end

  def self.find(pokemon_id, db)
    sql_string = <<-SQL_STRING

      select * from pokemon
      where id = ?

    SQL_STRING

    array = db.execute(sql_string, pokemon_id)
    array = array[0]
    Pokemon.new('name' => array[1], 'type' => array[2], 'id' => array[0])
  end






end
