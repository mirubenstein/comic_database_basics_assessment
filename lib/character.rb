class Character

  attr_accessor :name, :id

  def initialize attributes
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    all_characters = []
    results = DB.exec("SELECT * FROM characters;")
    results.each do |result|
      all_characters << Comic.new(result)
    end
    all_characters
  end

  def save
    @id = DB.exec("INSERT INTO characters (name) VALUES ('#{@name}') RETURNING id;").first['id'].to_i
  end

  def update attributes
    DB.exec("UPDATE characters SET name = '#{attributes['name']}' WHERE id = #{@id};")
    @name = attributes['name']
  end

  def delete
    DB.exec("DELETE FROM characters WHERE id = #{@id};")
  end

  def self.find character_id
    result = []
    self.all.each {|character| result = character if character.id.to_i == character_id}
    result
  end

  def list_comics
    all_comics = []
    results = DB.exec("SELECT comics.* FROM characters
                        JOIN comic_characters ON (comic_characters.character_id = characters.id)
                        JOIN comics ON (comic_characters.comic_id = comics.id)
                        WHERE characters.id = #{id};")
    results.each do |result|
      all_comics << Comic.new(result)
    end
    all_comics
  end

end
