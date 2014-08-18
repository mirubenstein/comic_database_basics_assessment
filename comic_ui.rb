require 'pg'
require './lib/comic'
require './lib/character'

DB = PG.connect({:dbname => 'comic'})

def main_menu
  puts "1) Comic Menu"
  puts "2) Character Menu"
  puts "0) Exit"
  case gets.chomp.to_i
  when 1 then comic_menu
  when 2 then character_menu
  when 0 then exit
  else
    puts "Enter a valid option"
  end
  main_menu
end

def list_comics
  Comic.all.each { |comic| puts comic.id.to_s + ") " + comic.name.to_s }
end

def list_characters
  Character.all.each { |character| puts character.id.to_s + ") " + character.name }
end

def comic_menu
  list_comics
  puts "Enter 'n' to add new comic"
  puts "Enter 'a' to add character to comic"
  puts "Enter 'e' to edit comic"
  puts "Enter 'd' to delete comic"
  puts "Enter 'l' to list comic characters"
  puts "Enter 'm' to return to the main menu"
  case gets.chomp
  when 'n' then comic_new
  when 'a' then comic_character_add
  when 'e' then comic_edit
  when 'd' then comic_delete
  when 'l' then comic_list_characters
  when 'm' then main_menu
  else
    puts "Enter a valid option"
    comic_menu
  end
end

def comic_new
  puts "Enter new comic name"
  comic = Comic.new('name' => gets.chomp)
  comic.save
  comic_menu
end

def comic_character_add
  list_comics
  puts "Select number of comic to add character to"
  comic = Comic.find(gets.chomp.to_i)
  list_characters
  puts "Select number of character to add to comic"
  character = Character.find(gets.chomp.to_i)
  comic.add_character(character)
  puts "#{character.name} has been added to #{comic.name}"
  comic_menu
end

def comic_edit
  list_comics
  puts "Select number of comic to edit"
  comic = Comic.find(gets.chomp.to_i)
  puts "Enter new name"
  comic.update('name' => gets.chomp)
  puts "Comic name has been updated to #{comic.name}"
  comic_menu
end

def comic_delete
  list_comics
  puts "Select number of comic to delete"
  comic = Comic.find(gets.chomp.to_i)
  comic.delete
  puts "Comic has been deleted"
  comic_menu
end

def comic_list_characters
  list_comics
  puts "Select number of comic to see its characters"
  comic = Comic.find(gets.chomp.to_i)
  comic.list_characters.each { |character| puts character.id.to_s + ") " +  character.name }
  comic_menu
end

def character_menu
  list_characters
  puts "Enter 'n' to add new character"
  puts "Enter 'e' to edit character"
  puts "Enter 'd' to delete character"
  puts "Enter 'l' to list character comics"
  puts "Enter 'm' to return to the main menu"
  case gets.chomp
  when 'n' then character_new
  when 'e' then character_edit
  when 'd' then character_delete
  when 'l' then character_list_comics
  when 'm' then main_menu
  else
    puts "Enter a valid option"
    character_menu
  end
end

def character_new
  puts "Enter new character name"
  character = Character.new('name' => gets.chomp)
  character.save
  character_menu
end

def character_edit
  list_characters
  puts "Select number of character to edit"
  character = Character.find(gets.chomp.to_i)
  puts "Enter new name"
  character.update('name' => gets.chomp)
  puts "Character name has been updated to #{character.name}"
  character_menu
end

def character_delete
  list_characters
  puts "Select number of character to delete"
  character = Character.find(gets.chomp.to_i)
  character.delete
  puts "Character has been deleted"
  character_menu
end

def character_list_comics
  list_characters
  puts "Select number of character to see comics they belong to"
  character = Character.find(gets.chomp.to_i)
  character.list_comics.each { |comic| puts comic.id.to_s + ") " +  comic.name }
  character_menu
end

main_menu
