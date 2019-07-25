require 'csv'
require_relative 'recipe'


class Cookbook
  attr_reader :recipes
  def initialize(csv_file_path)
    @path = csv_file_path
    @recipes = []
    CSV.foreach(@path) do |row|
      # Here, row is an array of columns
      # p "---------row:#{row}"
      @recipes.push(Recipe.new(row[0], row[1], row[2], row[3], boolean_value(row[4])))
      # p row
    end
    # p "------receipes:#{@recipes}"
  end

  def boolean_value(str)
    str == "true"
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    # p "cookbook.add_recipe recipe=#{recipe}"
    @recipes.push(recipe)
    save
  end

  def mark(index)
    # p @recipes[index]
    @recipes[index].mark!
    save
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save
  end

  def save
    CSV.open(@path, 'wb') do |csv|
      @recipes.each do |recipe|
        # p "---------recipe:#{recipe.name}  des=#{recipe.description}"
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.difficulty, recipe.done]
      end
    end
  end
end
