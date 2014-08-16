class Comic

  attr_accessor :name, :id

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

end

