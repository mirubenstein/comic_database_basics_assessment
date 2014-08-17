class Comic

  attr_accessor :name,
  :id

  def initialize attributes
    @name = attributes['name']
    @id = attributes['id']
  end

  def self.all
    all_comics = []
    results = DB.exec("SELECT * FROM comics;")
    results.each do |result|
      all_comics << Comic.new(result)
    end
    all_comics
  end

  def save
    @id = DB.exec("INSERT INTO comics (name) VALUES ('#{@name}') RETURNING id;").first['id'].to_i
  end

  def update attributes
    DB.exec("UPDATE comics SET name = '#{attributes['name']}' WHERE id = #{@id};")
    @name = attributes['name']
  end

  def delete
    DB.exec("DELETE FROM comics WHERE id = #{@id};")
  end

  def self.find comic_id
    result = []
    self.all.each {|comic| result = comic if comic.id.to_i == comic_id}
    result
  end

  def add_character character
    DB.exec("INSERT INTO comic_characters (comic_id, character_id) VALUES (#{self.id}, #{character.id});")
  end

  def list_characters
    all_characters = []
    results = DB.exec("SELECT characters.* FROM comics
                        JOIN comic_characters ON (comic_characters.comic_id = comics.id)
                        JOIN characters ON (comic_characters.character_id = characters.id)
                        WHERE comics.id = #{id};")
    results.each do |result|
      all_characters << Character.new(result)
    end
    all_characters
  end

end

# DB.exec("SELECT stations.* FROM stops
#   JOIN lines ON (stops.line_id = lines.id)
#   JOIN stations ON (stops.station_id = stations.id)
#   WHERE lines.id = #{id};")

